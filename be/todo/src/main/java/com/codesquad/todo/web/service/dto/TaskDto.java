package com.codesquad.todo.web.service.dto;

import com.codesquad.todo.web.domain.Task;

import java.time.LocalDateTime;

public class TaskDto {
    private long id;
    private String taskTitle;
    private String taskContent;
    private String authorName;
    private LocalDateTime createdDateTime;

    public TaskDto(Task task, String authorName) {
        this.id = task.getId();
        this.taskTitle = task.getTaskTitle();
        this.taskContent = task.getTaskContent();
        this.authorName = authorName;
        this.createdDateTime = task.getCreatedDateTime();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public void setTaskTitle(String taskTitle) {
        this.taskTitle = taskTitle;
    }

    public String getTaskContent() {
        return taskContent;
    }

    public void setTaskContent(String taskContent) {
        this.taskContent = taskContent;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

    public void setCreatedDateTime(LocalDateTime createdDateTime) {
        this.createdDateTime = createdDateTime;
    }
}
