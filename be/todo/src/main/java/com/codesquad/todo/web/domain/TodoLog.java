package com.codesquad.todo.web.domain;

import java.time.LocalDateTime;

public class TodoLog {
    private Long id;
    private String action;
    private User author;
    private LocalDateTime createdDateTime;

    public TodoLog(Long id, String action, User author) {
        this.id = id;
        this.action = action;
        this.author = author;
        this.createdDateTime = LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public String getAction() {
        return action;
    }

    public User getAuthor() {
        return author;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }
}
