package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.TodoColumnService;
import com.codesquad.todo.web.service.TodoUserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

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
    public ResponseEntity<Map<String, Object>> showColumnList() {
        Map<String, Object> responseMap = new HashMap<>();
        TodoUser todoUser = todoUserService.findUser(1L);
        responseMap.put("columns", todoColumnService.showColumnList(todoUser));
        return ResponseEntity.ok(responseMap);
    }
}
