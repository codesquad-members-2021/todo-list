package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoLog;
import com.codesquad.todo.web.domain.User;
import com.codesquad.todo.web.service.dto.TodoLogDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/logs")
public class TodoLogController {

    @GetMapping
    public ResponseEntity<Map<String, Object>> showTodoLogList() {
        Map<String, Object> responseMap = new HashMap<>();
        List<TodoLogDto> todoLogs = new ArrayList<>();

        User author = new User(1L, "라쿠운", "Racoon", "1234", "");
        todoLogs.add(new TodoLogDto(new TodoLog(1L, "'move' '1 자바스크립트 예제 실습 수정됨!' 'TODO' 'IN_PROGRESS'", author)));
        todoLogs.add(new TodoLogDto(new TodoLog(2L, "'move' '2 자바스크립트 예제 실습 수정됨!' 'TODO' 'IN_PROGRESS'", author)));

        responseMap.put("todoLogs", todoLogs);
        return ResponseEntity.ok(responseMap);
    }
}
