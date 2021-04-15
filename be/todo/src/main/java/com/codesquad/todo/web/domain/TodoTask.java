package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.service.dto.TaskParameterDto;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("TODO_TASK")
public class TodoTask {
    @Id
    private Long id;

    private String taskTitle;
    private String taskContent;
    private LocalDateTime createdDateTime;
    private LocalDateTime updatedDateTime;

    public TodoTask(String taskTitle, String taskContent) {
        this.taskTitle = taskTitle;
        this.taskContent = taskContent;
        this.createdDateTime = LocalDateTime.now();
        this.updatedDateTime = null;
    }

    protected TodoTask() {
    }

    public boolean isSameId(Long taskId) {
        return id.equals(taskId);
    }

    public boolean isSameTitle(TodoTask todoTask) {
        return taskTitle.equals(todoTask.taskTitle);
    }

    public boolean isSameContent(TodoTask todoTask) {
        return taskContent.equals(todoTask.taskContent);
    }

    public void update(String newTitle, String newContent) {
        taskTitle = newTitle;
        taskContent = newContent;
        updatedDateTime = LocalDateTime.now();
    }

    public void update(TaskParameterDto taskParameterDto) {
        taskTitle = taskParameterDto.getTaskTitle();
        taskContent = taskParameterDto.getTaskContent();
        updatedDateTime = LocalDateTime.now();
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
