package com.example.todolist.domain.work;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Work {
    @Id
    private Long id;

    private String title;

    private String description;

    private LocalDateTime createdTime;

    private int status;

    private Long author;

    public Work() {

    }

    public Work(String title, String description, int status, Long author) {
        this.title = title;
        this.description = description;
        this.createdTime = LocalDateTime.now();
        this.status = status;
        this.author = author;
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

    public LocalDateTime getCreatedTime() {
        return createdTime;
    }

    public int getStatus() {
        return status;
    }

    public Long getAuthor() {
        return author;
    }

    @Override
    public String toString() {
        return "Work{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", createdTime=" + createdTime +
                ", status=" + status +
                ", author=" + author +
                '}';
    }

}
