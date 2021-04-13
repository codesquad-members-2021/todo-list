package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoLog;
import com.codesquad.todo.web.domain.TodoLogRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/logs")
public class TodoLogController {

    private final TodoLogRepository todoLogRepository;

    public TodoLogController(TodoLogRepository todoLogRepository) {
        this.todoLogRepository = todoLogRepository;
    }

    @GetMapping
    public ResponseEntity<Map<String, Object>> showTodoLogList() {
        Map<String, Object> responseMap = new HashMap<>();
        List<TodoLog> todoLogList = todoLogRepository.findFiveTodoLogByUser(1L);
        responseMap.put("todoLogs", todoLogList);
        return ResponseEntity.ok(responseMap);
    }
}
