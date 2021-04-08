package com.example.todolist.web.dto;

import com.example.todolist.domain.work.Work;

import java.time.LocalDateTime;
import java.util.NoSuchElementException;

public class WorkSaveRequestDto {
    private Long id;
    private String title;
    private String description;
    private LocalDateTime createdTime;
    private int status;
    private Long author;



    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public LocalDateTime getCreatedTime() {
        return createdTime;
    }

    public int getStatus() {
        return status;
    }

    public Long getAuthor() {
        return author;
    }

    public WorkSaveRequestDto(String title, String description, LocalDateTime createdTime, int status, Long author) {
        this.title = title;
        this.description = description;
        this.createdTime = createdTime;
        this.status = status;
        this.author = author;
    }


    public Work toEntity() {
        if(title == null || description == null || createdTime == null || author == null) {
            throw new NoSuchElementException();
        }
        return new Work(title, description, status, author);
    }
}
