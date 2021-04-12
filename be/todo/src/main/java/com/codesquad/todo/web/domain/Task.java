package com.codesquad.todo.web.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Task {
    @Id
    private Long id;
    private String taskTitle;
    private String taskContent;
    private LocalDateTime createdDateTime;
    private LocalDateTime updatedDateTime;

    public Task(String taskTitle, String taskContent) {
        this.taskTitle = taskTitle;
        this.taskContent = taskContent;
        this.createdDateTime = LocalDateTime.now();
        this.updatedDateTime = null;
    }

    protected Task() {
    }

    public boolean isSameId(Long taskId){
        return id.equals(taskId);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

    public void setCreatedDateTime(LocalDateTime createdDateTime) {
        this.createdDateTime = createdDateTime;
    }

    public LocalDateTime getUpdatedDateTime() {
        return updatedDateTime;
    }

    public void setUpdatedDateTime(LocalDateTime updatedDateTime) {
        this.updatedDateTime = updatedDateTime;
    }

    @Override
    public String toString() {
        return "\nTask{" +
                "id=" + id +
                ", taskTitle='" + taskTitle + '\'' +
                ", taskContent='" + taskContent + '\'' +
                ", createdDateTime=" + createdDateTime +
                ", updatedDateTime=" + updatedDateTime +
                '}' + '\n';
    }
}
