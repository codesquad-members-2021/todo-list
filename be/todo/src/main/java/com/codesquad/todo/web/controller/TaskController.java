package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoTask;
import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.TodoTaskService;
import com.codesquad.todo.web.service.TodoUserService;
import com.codesquad.todo.web.service.dto.TaskDto;
import com.codesquad.todo.web.service.dto.TaskParameterDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/columns/{columnId}/tasks")
public class TaskController {

    private final TodoUserService todoUserService;
    private final TodoTaskService todoTaskService;

    public TaskController(TodoUserService todoUserService, TodoTaskService todoTaskService) {
        this.todoUserService = todoUserService;
        this.todoTaskService = todoTaskService;
    }

    @CrossOrigin
    @PostMapping
    public ResponseEntity<Map<String, Object>> createTask(@PathVariable Long columnId, @Valid TaskParameterDto taskParameterDto) {
        Map<String, Object> responseMap = new HashMap<>();
        TodoUser todoUser = todoUserService.findUser(1L);
        TaskDto taskDto = todoTaskService.createTask(todoUser, columnId, taskParameterDto);
        responseMap.put("task", taskDto);
        return ResponseEntity.ok(responseMap);
    }

    @CrossOrigin
    @DeleteMapping("/{taskId}")
    public void removeTask(@PathVariable Long columnId, @PathVariable Long taskId) {
        TodoUser todoUser = todoUserService.findUser(1L);
        todoTaskService.removeTask(todoUser, columnId, taskId);
    }

    @CrossOrigin
    @PutMapping("/{taskId}")
    public void updateTask(@PathVariable Long columnId, @PathVariable Long taskId, @Valid TaskParameterDto taskParameterDto) {
        TodoUser todoUser = todoUserService.findUser(1L);
        todoTaskService.updateTask(todoUser, columnId, taskId, taskParameterDto);
    }

    @CrossOrigin
    @PutMapping("/{taskId}/move")
    public void moveTask(@PathVariable Long columnId, @PathVariable Long taskId,
                         Long nextColumnId, int newTaskPosition) {
        TodoUser todoUser = todoUserService.findUser(1L);
        todoTaskService.moveTask(todoUser, columnId, nextColumnId, taskId, newTaskPosition);
    }

}
