package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.Task;
import com.codesquad.todo.web.domain.User;
import com.codesquad.todo.web.service.TaskService;
import com.codesquad.todo.web.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/columns/{columnId}/tasks")
public class TaskController {

    private final UserService userService;
    private final TaskService taskService;

    public TaskController(UserService userService, TaskService taskService) {
        this.userService = userService;
        this.taskService = taskService;
    }

    @PostMapping
    public ResponseEntity<Map<String, Object>> createTask(@PathVariable Long columnId, String taskTitle, String taskContent) {
        Map<String, Object> responseMap = new HashMap<>();
        User user = userService.findUser(1L);
        Task task = taskService.createTask(user, columnId, taskTitle, taskContent);
        responseMap.put("task", task);
        return ResponseEntity.ok(responseMap);
    }

    @DeleteMapping("/{taskId}")
    public void removeTask(@PathVariable Long columnId, @PathVariable Long taskId) {
        User user = userService.findUser(1L);
        taskService.removeTask(user, columnId, taskId);
    }

    @PutMapping("/{taskId}")
    public void updateTask(@PathVariable Long columnId, @PathVariable Long taskId, Task newTask) {
        User user = userService.findUser(1L);
        taskService.updateTask(user, columnId, taskId, newTask);
    }

    @PutMapping("/{taskId}/move")
    public void moveTask(@PathVariable Long columnId, @PathVariable Long taskId,
                         Long nextColumnId, int newTaskPosition) {
        User user = userService.findUser(1L);
        taskService.moveTask(user, columnId, nextColumnId, taskId, newTaskPosition);
    }

}
