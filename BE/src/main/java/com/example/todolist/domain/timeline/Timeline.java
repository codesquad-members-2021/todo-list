package com.example.todolist.domain.timeline;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Timeline {
    @Id
    private Long id;
    private String description;
    private LocalDateTime createdTime;
    private Long author;
}
