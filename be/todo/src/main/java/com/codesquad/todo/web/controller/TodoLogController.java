package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.TodoLogService;
import com.codesquad.todo.web.service.TodoUserService;
import com.codesquad.todo.web.service.dto.ShowTodoLogListDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/logs")
public class TodoLogController {

    private final TodoLogService todoLogService;
    private final TodoUserService todoUserService;

    public TodoLogController(TodoLogService todoLogService, TodoUserService todoUserService) {
        this.todoLogService = todoLogService;
        this.todoUserService = todoUserService;
    }

    @CrossOrigin
    @GetMapping
    public ResponseEntity<ShowTodoLogListDto> showTodoLogList() {
        TodoUser todoUser = todoUserService.findUser(1L);
        return ResponseEntity.ok(todoLogService.showTodoLogList(todoUser));
    }
}
