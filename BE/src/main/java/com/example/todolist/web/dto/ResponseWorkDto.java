package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;

import java.time.LocalDateTime;

public class ResponseWorkDto {

    private Long id;

    private String title;

    private String description;

    private LocalDateTime createdAt;

    private int status;

    private String author;

    public ResponseWorkDto() {}

    public ResponseWorkDto(Work work, User user) {
        this.id = work.getId();
        this.title = work.getTitle();
        this.description = work.getDescription();
        this.createdAt = work.getCreatedAt();
        this.status = work.getStatus();
        this.author = user.getUserId();
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public int getStatus() {
        return status;
    }

    public String getAuthor() {
        return author;
    }

    @Override
    public String toString() {
        return "ResponseWorkDto{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", createdAt=" + createdAt +
                ", status=" + status +
                ", author='" + author + '\'' +
                '}';
    }

}
