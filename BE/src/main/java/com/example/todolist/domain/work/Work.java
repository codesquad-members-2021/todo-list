package com.example.todolist.domain.work;

import com.example.todolist.domain.user.User;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Work {

    @Id
    private Long id;

    private String title;

    private String description;

    private LocalDateTime createdAt;

    private int status;

    private Long authorId;

    public Work() {}

    public Work(String title, String description, int status) {
        this.title = title;
        this.description = description;
        this.createdAt = LocalDateTime.now();
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
        this.authorId = sessionUser.getId();
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
        return authorId.equals(sessionUser.getId());
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

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public int getStatus() {
        return status;
    }

    public Long getAuthorId() {
        return authorId;
    }

    @Override
    public String toString() {
        return "Work{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", createdAt=" + createdAt +
                ", status=" + status +
                ", authorId=" + authorId +
                '}';
    }

}
