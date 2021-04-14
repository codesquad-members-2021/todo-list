package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.*;
import com.codesquad.todo.web.service.dto.TaskDto;
import org.springframework.stereotype.Service;

@Service
public class TaskService {
    private final UserRepository userRepository;

    public TaskService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public TaskDto createTask(User user, Long columnId, String taskTitle, String taskContent) {
        Column column = user.findColumnById(columnId);
        column.addTask(taskTitle, taskContent);

        TodoLog todoLog = TodoLog.buildCreateTodoLog(column.getColumnTitle(), taskTitle);
        user.addTodoLog(todoLog);

        user = userRepository.save(user);
        column = user.findColumnById(columnId);
        Task task = column.lastTask();
        return new TaskDto(task, user.getName());
    }

    public void removeTask(User user, Long columnId, Long taskId) {
        Column column = user.findColumnById(columnId);
        Task removedTask = column.popTask(taskId);
        TodoLog todoLog = TodoLog.buildRemoveTodoLog(column.getColumnTitle(), removedTask.getTaskTitle());
        user.addTodoLog(todoLog);
        userRepository.save(user);
    }

    public void updateTask(User user, Long columnId, Long taskId, Task newTask) {
        newTask.verifyTaskEntityIsNotEmpty();
        Column column = user.findColumnById(columnId);
        Task foundTask = column.findTaskById(taskId);
        foundTask.update(newTask);
        TodoLog todoLog = TodoLog.buildUpdateTodoLog(column.getColumnTitle(), foundTask.getTaskTitle());
        user.addTodoLog(todoLog);
        userRepository.save(user);
    }

    public void moveTask(User user, Long columnId, Long nextColumnId, Long taskId, int newTaskPosition) {
        user.moveTask(columnId, nextColumnId, taskId, newTaskPosition);
        userRepository.save(user);
    }
}
