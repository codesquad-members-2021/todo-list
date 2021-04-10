package com.example.todolist.domain.work;

import com.example.todolist.domain.user.User;
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

    public Work() {}

    public Work(String title, String description, int status) {
        this.title = title;
        this.description = description;
        this.createdTime = LocalDateTime.now();
        this.status = status;
    }

    public Work(String title, String description) {
        this.title = title;
        this.description = description;
    }

    public Work(int status) {
        this.status = status;
    }

    public void save(User sessionUser) {
        this.author = sessionUser.getId();
    }

    public void update(Work work) {
        this.title = work.title;
        this.description = work.description;
    }

    public void delete() {
        this.status = 0;
    }

    public void move(Work work) {
        this.status = work.status;
    }

    public boolean matchAuthor(User sessionUser) {
        return author.equals(sessionUser.getId());
    }

    public boolean isNotDeleted() {
        return this.status != 0;
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
