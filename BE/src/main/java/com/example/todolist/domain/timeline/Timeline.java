package com.example.todolist.domain.timeline;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Timeline {

    @Id
    private Long id;

    private String description;

    private LocalDateTime createdTime;

    private Long author;

    public Timeline() {

    }

    public Timeline(String description, Long author) {
        this.description = description;
        this.createdTime = LocalDateTime.now();
        this.author = author;
    }

    public Long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public LocalDateTime getCreatedTime() {
        return createdTime;
    }

    public Long getAuthor() {
        return author;
    }

    @Override
    public String toString() {
        return "Timeline{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", createdTime=" + createdTime +
                ", author=" + author +
                '}';
    }

}
