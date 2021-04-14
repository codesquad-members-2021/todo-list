package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoTask;
import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.TaskService;
import com.codesquad.todo.web.service.UserService;
import com.codesquad.todo.web.service.dto.TaskDto;
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

    @CrossOrigin
    @PostMapping
    public ResponseEntity<Map<String, Object>> createTask(@PathVariable Long columnId, String taskTitle, String taskContent) {
        Map<String, Object> responseMap = new HashMap<>();
        TodoUser todoUser = userService.findUser(1L);
        TaskDto taskDto = taskService.createTask(todoUser, columnId, taskTitle, taskContent);
        responseMap.put("task", taskDto);
        return ResponseEntity.ok(responseMap);
    }

    @CrossOrigin
    @DeleteMapping("/{taskId}")
    public void removeTask(@PathVariable Long columnId, @PathVariable Long taskId) {
        TodoUser todoUser = userService.findUser(1L);
        taskService.removeTask(todoUser, columnId, taskId);
    }

    @CrossOrigin
    @PutMapping("/{taskId}")
    public void updateTask(@PathVariable Long columnId, @PathVariable Long taskId, TodoTask newTodoTask) {
        TodoUser todoUser = userService.findUser(1L);
        taskService.updateTask(todoUser, columnId, taskId, newTodoTask);
    }

    @CrossOrigin
    @PutMapping("/{taskId}/move")
    public void moveTask(@PathVariable Long columnId, @PathVariable Long taskId,
                         Long nextColumnId, int newTaskPosition) {
        TodoUser todoUser = userService.findUser(1L);
        taskService.moveTask(todoUser, columnId, nextColumnId, taskId, newTaskPosition);
    }

}
