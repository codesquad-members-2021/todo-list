package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.TodoLogService;
import com.codesquad.todo.web.service.TodoUserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

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
    public ResponseEntity<Map<String, Object>> showTodoLogList() {
        Map<String, Object> responseMap = new HashMap<>();
        TodoUser todoUser = todoUserService.findUser(1L);
        responseMap.put("todoLogs", todoLogService.showTodoLogList(todoUser));
        return ResponseEntity.ok(responseMap);
    }
}
