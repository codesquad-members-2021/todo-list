package com.codesquad.todo.web.service.dto;

import com.codesquad.todo.web.domain.Column;

import java.util.List;

public class ColumnDto {
    private long id;
    private String columnTitle;
    private List<TaskDto> taskList;

    public ColumnDto(Column column) {
        this.id = column.getId();
        this.columnTitle = column.getColumnTitle();
        this.taskList = column.convertTaskListToTaskDtoList();
    }

    public long getId() {
        return id;
    }

    public String getColumnTitle() {
        return columnTitle;
    }

    public List<TaskDto> getTaskList() {
        return taskList;
    }
}
