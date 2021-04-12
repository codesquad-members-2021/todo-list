package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.*;
import com.codesquad.todo.web.exceptions.ColumnNotFoundException;
import com.codesquad.todo.web.exceptions.UserNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/columns/{columnId}/tasks")
public class TaskController {

    private final UserRepository userRepository;

    public TaskController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping
    public ResponseEntity<Map<String, Object>> createTask(@PathVariable Long columnId, String taskTitle, String taskContent) {
        Map<String, Object> responseMap = new HashMap<>();
        User user = userRepository.findById(1L).orElseThrow(UserNotFoundException::new);
        Column column = user.findColumnById(columnId);
        column.addTask(taskTitle, taskContent);
        user = userRepository.save(user);
        column = user.findColumnById(columnId);

        responseMap.put("task", column.lastTask());
        return ResponseEntity.ok(responseMap);
    }
}
