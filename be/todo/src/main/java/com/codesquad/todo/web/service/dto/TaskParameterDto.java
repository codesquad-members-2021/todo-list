package com.codesquad.todo.web.service.dto;

import javax.validation.constraints.NotEmpty;

public class TaskParameterDto {
    @NotEmpty
    private final String taskTitle;
    @NotEmpty
    private final String taskContent;

    public TaskParameterDto(String taskTitle, String taskContent) {
        this.taskTitle = taskTitle;
        this.taskContent = taskContent;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public String getTaskContent() {
        return taskContent;
    }
}
