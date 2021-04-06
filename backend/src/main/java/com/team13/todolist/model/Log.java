package com.team13.todolist.model;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Log {
    @Id
    private Long id;

    private Long actionUserId;
    private String action;
    private String title;
    private String fromColumn;
    private String toColumn;
    private LocalDateTime actionTime;
}
