package com.codesquad.todo.web.service.dto;

import com.codesquad.todo.web.domain.TodoColumn;

import java.util.ArrayList;
import java.util.List;

public class TodoColumnDto {
    private Long id;
    private String columnTitle;
    private List<TodoTaskDto> taskList = new ArrayList<>();

    public TodoColumnDto(TodoColumn todoColumn) {
        this.id = todoColumn.getId();
        this.columnTitle = todoColumn.getColumnTitle();
    }

    public void addTaskDto(TodoTaskDto todoTaskDto) {
        taskList.add(todoTaskDto);
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

    public List<TodoTaskDto> getTaskList() {
        return taskList;
    }

    public void setTaskList(List<TodoTaskDto> taskList) {
        this.taskList = taskList;
    }
}
