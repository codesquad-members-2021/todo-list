package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.User;
import com.codesquad.todo.web.domain.UserRepository;
import com.codesquad.todo.web.exceptions.UserNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/columns")
public class ColumnController {

    private final UserRepository userRepository;

    public ColumnController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public ResponseEntity<Map<String, Object>> showColumnList() {
        Map<String, Object> responseMap = new HashMap<>();
        User user = userRepository.findById(1L).orElseThrow(UserNotFoundException::new);
        responseMap.put("columns", user.getColumnList());
        return ResponseEntity.ok(responseMap);
    }
}
