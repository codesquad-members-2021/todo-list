package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.TodoTaskService;
import com.codesquad.todo.web.service.TodoUserService;
import com.codesquad.todo.web.service.dto.CreateTaskDto;
import com.codesquad.todo.web.service.dto.TaskParameterDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

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
    public ResponseEntity<CreateTaskDto> createTask(@PathVariable Long columnId, @Valid TaskParameterDto taskParameterDto) {
        TodoUser todoUser = todoUserService.findUser(1L);
        CreateTaskDto createTaskDto = todoTaskService.createTask(todoUser, columnId, taskParameterDto);
        return ResponseEntity.ok(createTaskDto);
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
