package com.codesquad.todo.web.service.dto;

public class CreateTaskDto {
    private final TaskDto task;

    public CreateTaskDto(TaskDto task) {
        this.task = task;
    }

    public TaskDto getTask() {
        return task;
    }
}
