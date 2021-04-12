package com.codesquad.todo.web.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class TodoLog {
    @Id
    private Long id;
    private String action;
    private LocalDateTime createdDateTime;

    public TodoLog(String action) {
        this.action = action;
        this.createdDateTime = LocalDateTime.now();
    }

    protected TodoLog() {
    }

    public Long getId() {
        return id;
    }

    public String getAction() {
        return action;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

    @Override
    public String toString() {
        return "TodoLog{" +
                "id=" + id +
                ", action='" + action + '\'' +
                ", createdDateTime=" + createdDateTime +
                '}';
    }
}
