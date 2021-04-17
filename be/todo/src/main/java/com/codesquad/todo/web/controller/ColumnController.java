package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.TodoColumnService;
import com.codesquad.todo.web.service.TodoUserService;
import com.codesquad.todo.web.service.dto.ShowColumnListDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/columns")
public class ColumnController {

    private final TodoUserService todoUserService;
    private final TodoColumnService todoColumnService;

    public ColumnController(TodoUserService todoUserService, TodoColumnService todoColumnService) {
        this.todoUserService = todoUserService;
        this.todoColumnService = todoColumnService;
    }

    @CrossOrigin
    @GetMapping
    public ResponseEntity<ShowColumnListDto> showColumnList() {
        TodoUser todoUser = todoUserService.findUser(1L);
        return ResponseEntity.ok(todoColumnService.showColumnList(todoUser));
    }
}
