package com.example.todolist.domain.work;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;

import java.time.LocalDateTime;

public class Work {
    @Id
    private Long id;


    private String title;
    private String description;
    private LocalDateTime createdTime;
    private int status;

    private Long author;
}
