package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.User;
import com.codesquad.todo.web.service.ColumnService;
import com.codesquad.todo.web.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/columns")
public class ColumnController {

    private final UserService userService;
    private final ColumnService columnService;

    public ColumnController(UserService userService, ColumnService columnService) {
        this.userService = userService;
        this.columnService = columnService;
    }

    @GetMapping
    public ResponseEntity<Map<String, Object>> showColumnList() {
        Map<String, Object> responseMap = new HashMap<>();
        User user = userService.findUser(1L);
        responseMap.put("columns", columnService.showColumnList(user));
        return ResponseEntity.ok(responseMap);
    }
}
