package com.codesquad.todo.web.domain;

import java.time.LocalDateTime;

public class TodoLog {
    private long id;
    private String action;
    private User author;
    private LocalDateTime createdDateTime;

    public TodoLog(long id, String action, User author) {
        this.id = id;
        this.action = action;
        this.author = author;
        this.createdDateTime = LocalDateTime.now();
    }

    public long getId() {
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
