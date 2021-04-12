package com.codesquad.todo.web.service.dto;

import com.codesquad.todo.web.domain.Column;

import java.util.List;

public class ColumnDto {
    private Long id;
    private String columnTitle;
    private List<TaskDto> taskList;

    public ColumnDto(Column column) {
        this.id = column.getId();
        this.columnTitle = column.getColumnTitle();
        this.taskList = column.convertTaskListToTaskDtoList();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getColumnTitle() {
        return columnTitle;
    }

    public void setColumnTitle(String columnTitle) {
        this.columnTitle = columnTitle;
    }

    public List<TaskDto> getTaskList() {
        return taskList;
    }

    public void setTaskList(List<TaskDto> taskList) {
        this.taskList = taskList;
    }
}
