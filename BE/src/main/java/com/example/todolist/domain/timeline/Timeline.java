package com.example.todolist.domain.timeline;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Timeline {

    @Id
    private Long id;

    private String description;

    private LocalDateTime createdAt;

    private Long authorId;

    public Timeline() {}

    public Timeline(String description, Long authorId) {
        this.description = description;
        this.createdAt = LocalDateTime.now();
        this.authorId = authorId;
    }

    public Long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public Long getAuthorId() {
        return authorId;
    }

    @Override
    public String toString() {
        return "Timeline{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", createdAt=" + createdAt +
                ", authorId=" + authorId +
                '}';
    }

}
