package com.example.todolist.web.dto;

import com.example.todolist.domain.work.Work;

import java.time.LocalDateTime;

public class WorkListResponseDto {
    private Long id;
    private String title;
    private String description;
    private LocalDateTime createdTime;
    private int status;
    private Long author;

    public WorkListResponseDto(Work entity) {
        this.id = entity.getId();
        this.title = entity.getTitle();
        this.description = entity.getDescription();
        this.createdTime = entity.getCreatedTime();
        this.status = entity.getStatus();
        this.author =entity.getAuthor();
    }
}
