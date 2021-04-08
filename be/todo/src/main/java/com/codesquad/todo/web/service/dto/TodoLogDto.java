package com.codesquad.todo.web.service.dto;

import com.codesquad.todo.web.domain.TodoLog;
import com.codesquad.todo.web.domain.User;

import java.time.LocalDateTime;

public class TodoLogDto {
    private long id;
    private String action;
    private String authorName;
    private LocalDateTime createdDateTime;

    public TodoLogDto(TodoLog todoLog) {
        this.id = todoLog.getId();
        this.action = todoLog.getAction();
        this.authorName = todoLog.getAuthor().getName();
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
