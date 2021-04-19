package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.TodoTaskService;
import com.codesquad.todo.web.service.TodoUserService;
import com.codesquad.todo.web.service.dto.CreateTodoTaskDto;
import com.codesquad.todo.web.service.dto.TodoTaskParameterDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/columns/{columnId}/tasks")
public class TodoTaskController {

    private final TodoUserService todoUserService;
    private final TodoTaskService todoTaskService;

    public TodoTaskController(TodoUserService todoUserService, TodoTaskService todoTaskService) {
        this.todoUserService = todoUserService;
        this.todoTaskService = todoTaskService;
    }

    @CrossOrigin
    @PostMapping
    public ResponseEntity<CreateTodoTaskDto> createTask(@PathVariable Long columnId, @Valid TodoTaskParameterDto todoTaskParameterDto) {
        TodoUser todoUser = todoUserService.findUser(1L);
        CreateTodoTaskDto createTodoTaskDto = todoTaskService.createTask(todoUser, columnId, todoTaskParameterDto);
        return ResponseEntity.ok(createTodoTaskDto);
    }

    @CrossOrigin
    @DeleteMapping("/{taskId}")
    public void removeTask(@PathVariable Long columnId, @PathVariable Long taskId) {
        TodoUser todoUser = todoUserService.findUser(1L);
        todoTaskService.removeTask(todoUser, columnId, taskId);
    }

    @CrossOrigin
    @PutMapping("/{taskId}")
    public void updateTask(@PathVariable Long columnId, @PathVariable Long taskId, @Valid TodoTaskParameterDto todoTaskParameterDto) {
        TodoUser todoUser = todoUserService.findUser(1L);
        todoTaskService.updateTask(todoUser, columnId, taskId, todoTaskParameterDto);
    }

    @CrossOrigin
    @PutMapping("/{taskId}/move")
    public void moveTask(@PathVariable Long columnId, @PathVariable Long taskId,
                         Long nextColumnId, int newTaskPosition) {
        TodoUser todoUser = todoUserService.findUser(1L);
        todoTaskService.moveTask(todoUser, columnId, nextColumnId, taskId, newTaskPosition);
    }

}
