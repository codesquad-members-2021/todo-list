package com.codesquad.todo.web.service.dto;

import javax.validation.constraints.NotBlank;

public class TodoTaskParameterDto {
    @NotBlank(message = "태스크 타이틀은 비어있으면 안됩니다")
    private final String taskTitle;
    @NotBlank(message = "태스크 컨텐츠는 비어있으면 안됩니다")
    private final String taskContent;

    public TodoTaskParameterDto(String taskTitle, String taskContent) {
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
