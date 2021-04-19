package com.codesquad.todo.web.service.dto;

import java.util.ArrayList;
import java.util.List;

public class ShowColumnListDto {
    private final List<TodoColumnDto> columns = new ArrayList<>();

    public List<TodoColumnDto> getColumns() {
        return columns;
    }

    public void addColumnDto(TodoColumnDto todoColumnDto) {
        columns.add(todoColumnDto);
    }
}
