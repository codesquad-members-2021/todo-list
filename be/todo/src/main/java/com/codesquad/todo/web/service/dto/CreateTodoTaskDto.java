package com.codesquad.todo.web.service.dto;

public class CreateTodoTaskDto {
    private final TodoTaskDto task;

    public CreateTodoTaskDto(TodoTaskDto task) {
        this.task = task;
    }

    public TodoTaskDto getTask() {
        return task;
    }
}
