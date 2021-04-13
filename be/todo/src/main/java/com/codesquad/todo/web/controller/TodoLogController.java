package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.service.TodoLogService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/logs")
public class TodoLogController {

    private final TodoLogService todoLogService;

    public TodoLogController(TodoLogService todoLogService) {
        this.todoLogService = todoLogService;
    }

    @GetMapping
    public ResponseEntity<Map<String, Object>> showTodoLogList() {
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("todoLogs", todoLogService.showTodoLogList());
        return ResponseEntity.ok(responseMap);
    }
}
