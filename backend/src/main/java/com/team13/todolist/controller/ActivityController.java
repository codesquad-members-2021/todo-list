package com.team13.todolist.controller;

import com.team13.todolist.model.Activity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/activities")
public class ActivityController {

    @GetMapping
    public ResponseEntity<Map<String, List<Activity>>> columns() {
        Map<String, List<Activity>> columnsResponseBody = new HashMap<>();

        columnsResponseBody.put("activities",
                Arrays.asList(
                        new Activity(4L, 1L, "삭제", "GitHub 공부", null, null, LocalDateTime.now()),
                        new Activity(3L, 1L, "변경", "GitHub 공부", null, null, LocalDateTime.now()),
                        new Activity(2L, 1L, "이동", "git 공부", "해야할 일", "하고있는 일", LocalDateTime.now()),
                        new Activity(1L, 1L, "등록", "git 공부", null, "해야할 일", LocalDateTime.now())
                ));
        return ResponseEntity.ok(columnsResponseBody);
    }

}
