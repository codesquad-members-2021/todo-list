package com.codesquad.todo.web.service.dto;

import java.util.ArrayList;
import java.util.List;

public class ShowColumnListDto {
    private final List<ColumnDto> columns = new ArrayList<>();

    public List<ColumnDto> getColumns() {
        return columns;
    }

    public void addColumnDto(ColumnDto columnDto) {
        columns.add(columnDto);
    }
}
