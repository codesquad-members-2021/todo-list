package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.*;
import com.codesquad.todo.web.exceptions.TaskNotFoundException;
import com.codesquad.todo.web.exceptions.UserNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/columns/{columnId}/tasks")
public class TaskController {

    private final UserRepository userRepository;
    private final TaskRepository taskRepository;

    public TaskController(UserRepository userRepository, TaskRepository taskRepository) {
        this.userRepository = userRepository;
        this.taskRepository = taskRepository;
    }

    @PostMapping
    public ResponseEntity<Map<String, Object>> createTask(@PathVariable Long columnId, String taskTitle, String taskContent) {
        Map<String, Object> responseMap = new HashMap<>();
        User user = userRepository.findById(1L).orElseThrow(UserNotFoundException::new);
        Column column = user.findColumnById(columnId);
        column.addTask(taskTitle, taskContent);
        user = userRepository.save(user);
        column = user.findColumnById(columnId);

        responseMap.put("task", column.lastTask());
        return ResponseEntity.ok(responseMap);
    }

    @DeleteMapping("/{taskId}")
    public void removeTask(@PathVariable Long columnId, @PathVariable Long taskId) {
        User user = userRepository.findById(1L).orElseThrow(UserNotFoundException::new);
        Column column = user.findColumnById(columnId);
        column.removeTaskById(taskId);
        userRepository.save(user);
    }

    @PutMapping("/{taskId}")
    public void updateTask(@PathVariable Long columnId, @PathVariable Long taskId, Task newTask) {
        Task foundTask = taskRepository.findById(taskId).orElseThrow(TaskNotFoundException::new);
        foundTask.update(newTask);
        taskRepository.save(foundTask);
    }

    @PutMapping("/{taskId}/move")
    public void moveTask(@PathVariable Long columnId, @PathVariable Long taskId,
                         Long nextColumnId, int newTaskPosition) {
        User user = userRepository.findById(1L).orElseThrow(UserNotFoundException::new);
        user.moveTask(columnId, nextColumnId, taskId, newTaskPosition);
        userRepository.save(user);
    }

}
