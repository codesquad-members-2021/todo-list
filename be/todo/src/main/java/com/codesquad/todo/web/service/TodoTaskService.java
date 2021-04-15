package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.*;
import com.codesquad.todo.web.service.dto.TaskDto;
import com.codesquad.todo.web.service.dto.TaskParameterDto;
import org.springframework.stereotype.Service;

@Service
public class TodoTaskService {
    private final UserRepository userRepository;

    public TodoTaskService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public TaskDto createTask(TodoUser todoUser, Long columnId, TaskParameterDto taskParameterDto) {
        TodoColumn todoColumn = todoUser.findColumnById(columnId);
        todoColumn.addTask(taskParameterDto);

        TodoLog todoLog = TodoLog.buildCreateTodoLog(todoColumn.getColumnTitle(), taskParameterDto.getTaskTitle());
        todoUser.addTodoLog(todoLog);

        todoUser = userRepository.save(todoUser);
        todoColumn = todoUser.findColumnById(columnId);
        TodoTask todoTask = todoColumn.firstTask();
        return new TaskDto(todoTask, todoUser.getName());
    }

    public void removeTask(TodoUser todoUser, Long columnId, Long taskId) {
        TodoColumn todoColumn = todoUser.findColumnById(columnId);
        TodoTask removedTodoTask = todoColumn.popTask(taskId);
        TodoLog todoLog = TodoLog.buildRemoveTodoLog(todoColumn.getColumnTitle(), removedTodoTask.getTaskTitle());
        todoUser.addTodoLog(todoLog);
        userRepository.save(todoUser);
    }

    public void updateTask(TodoUser todoUser, Long columnId, Long taskId, TaskParameterDto taskParameterDto) {
        TodoColumn todoColumn = todoUser.findColumnById(columnId);
        TodoTask foundTodoTask = todoColumn.findTaskById(taskId);
        foundTodoTask.update(taskParameterDto);
        TodoLog todoLog = TodoLog.buildUpdateTodoLog(todoColumn.getColumnTitle(), foundTodoTask.getTaskTitle());
        todoUser.addTodoLog(todoLog);
        userRepository.save(todoUser);
    }

    public void moveTask(TodoUser todoUser, Long columnId, Long nextColumnId, Long taskId, int newTaskPosition) {
        todoUser.moveTask(columnId, nextColumnId, taskId, newTaskPosition);
        userRepository.save(todoUser);
    }
}
