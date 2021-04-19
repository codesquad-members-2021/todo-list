package com.codesquad.todo.web.service.dto;

import java.util.ArrayList;
import java.util.List;

public class ShowTodoLogListDto {
    private final List<TodoLogDto> todoLogs = new ArrayList<>();

    public void addTodoLogDto(TodoLogDto todoLogDto) {
        todoLogs.add(todoLogDto);
    }

    public List<TodoLogDto> getTodoLogs() {
        return todoLogs;
    }
}
