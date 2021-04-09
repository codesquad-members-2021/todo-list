package com.codesquad.todo.web.service.dto;

import com.codesquad.todo.web.domain.Column;
import com.codesquad.todo.web.domain.Task;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ColumnDto {
    private long id;
    private String columnTitle;
    private List<TaskDto> taskList;

    public ColumnDto(Column column) {
        this.id = column.getId();
        this.columnTitle = column.getColumnTitle();
        this.taskList = convertTasksToTaskDtos(column.getTaskList());
    }

    private static List<TaskDto> convertTasksToTaskDtos(List<Task> taskList) {
        List<TaskDto> taskDtoList = new ArrayList<>();
        for(Task task : taskList) {
            taskDtoList.add(new TaskDto(task));
        }
        return taskDtoList;
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
