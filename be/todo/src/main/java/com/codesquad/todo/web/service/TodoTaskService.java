package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.*;
import com.codesquad.todo.web.service.dto.TaskDto;
import org.springframework.stereotype.Service;

@Service
public class TodoTaskService {
    private final UserRepository userRepository;

    public TodoTaskService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public TaskDto createTask(TodoUser todoUser, Long columnId, String taskTitle, String taskContent) {
        TodoColumn todoColumn = todoUser.findColumnById(columnId);
        todoColumn.addTask(taskTitle, taskContent);

        TodoLog todoLog = TodoLog.buildCreateTodoLog(todoColumn.getColumnTitle(), taskTitle);
        todoUser.addTodoLog(todoLog);

        todoUser = userRepository.save(todoUser);
        todoColumn = todoUser.findColumnById(columnId);
        TodoTask todoTask = todoColumn.lastTask();
        return new TaskDto(todoTask, todoUser.getName());
    }

    public void removeTask(TodoUser todoUser, Long columnId, Long taskId) {
        TodoColumn todoColumn = todoUser.findColumnById(columnId);
        TodoTask removedTodoTask = todoColumn.popTask(taskId);
        TodoLog todoLog = TodoLog.buildRemoveTodoLog(todoColumn.getColumnTitle(), removedTodoTask.getTaskTitle());
        todoUser.addTodoLog(todoLog);
        userRepository.save(todoUser);
    }

    public void updateTask(TodoUser todoUser, Long columnId, Long taskId, TodoTask newTodoTask) {
        newTodoTask.verifyTaskEntityIsNotEmpty();
        TodoColumn todoColumn = todoUser.findColumnById(columnId);
        TodoTask foundTodoTask = todoColumn.findTaskById(taskId);
        foundTodoTask.update(newTodoTask);
        TodoLog todoLog = TodoLog.buildUpdateTodoLog(todoColumn.getColumnTitle(), foundTodoTask.getTaskTitle());
        todoUser.addTodoLog(todoLog);
        userRepository.save(todoUser);
    }

    public void moveTask(TodoUser todoUser, Long columnId, Long nextColumnId, Long taskId, int newTaskPosition) {
        todoUser.moveTask(columnId, nextColumnId, taskId, newTaskPosition);
        userRepository.save(todoUser);
    }
}
