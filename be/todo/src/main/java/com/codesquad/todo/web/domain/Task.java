package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.exceptions.InvalidEntityDetectedException;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

import static com.codesquad.todo.web.util.VerifyUtil.isEmpty;

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

    public void verifyTaskEntityIsNotEmpty() {
        if (isEmpty(taskTitle) || isEmpty(taskContent)) {
            throw new InvalidEntityDetectedException(InvalidEntityDetectedException.TASK_IS_NULL);
        }
    }

    public boolean isSameId(Long taskId) {
        return id.equals(taskId);
    }

    public boolean isSameTitle(Task task) {
        return taskTitle.equals(task.taskTitle);
    }

    public boolean isSameContent(Task task) {
        return taskContent.equals(task.taskContent);
    }

    public void update(String newTitle, String newContent) {
        taskTitle = newTitle;
        taskContent = newContent;
        updatedDateTime = LocalDateTime.now();
    }

    public void update(Task newTask) {
        taskTitle = newTask.taskTitle;
        taskContent = newTask.taskContent;
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
