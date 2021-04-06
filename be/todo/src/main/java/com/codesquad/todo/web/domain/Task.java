package com.codesquad.todo.web.domain;

import java.time.LocalDateTime;

public class Task {
    private final long id;
    private final String taskTitle;
    private final String taskContent;
    private final User author;
    private final Column column;
    private final LocalDateTime createdDateTime;

    public Task(long id, String taskTitle, String taskContent, User author, Column column, LocalDateTime createdDateTime) {
        this.id = id;
        this.taskTitle = taskTitle;
        this.taskContent = taskContent;
        this.author = author;
        this.column = column;
        this.createdDateTime = createdDateTime;
    }

    public long getId() {
        return id;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public String getTaskContent() {
        return taskContent;
    }

    public User getAuthor() {
        return author;
    }

    public Column getColumn() {
        return column;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }
}
