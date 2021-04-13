package com.codesquad.todo.web.service.dto;

import com.codesquad.todo.web.domain.TodoLog;

import java.time.LocalDateTime;

public class TodoLogDto {
    private final long id;
    private final String action;
    private final String authorName;
    private final LocalDateTime createdDateTime;

    public TodoLogDto(TodoLog todoLog, String authorName) {
        this.id = todoLog.getId();
        this.action = todoLog.getAction();
        this.authorName = authorName;
        this.createdDateTime = todoLog.getCreatedDateTime();
    }

    public long getId() {
        return id;
    }

    public String getAction() {
        return action;
    }

    public String getAuthorName() {
        return authorName;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }
}
