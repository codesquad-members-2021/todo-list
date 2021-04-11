package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.service.dto.TaskDto;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Column {
    private Long id;
    private String columnTitle;
    private List<Task> taskList;

    public Column(long id, String columnTitle, List<Task> taskList) {
        this.id = id;
        this.columnTitle = columnTitle;
        this.taskList = taskList;
    }

    public Column(long id, String columnTitle) {
        this(id, columnTitle, new ArrayList<>());
    }

    public Long getId() {
        return id;
    }

    public String getColumnTitle() {
        return columnTitle;
    }

    public List<Task> getTaskList() {
        return taskList;
    }

    public void addTask(Task task) {
        taskList.add(task);
    }

    public List<TaskDto> convertTaskListToTaskDtoList() {
        return taskList.stream().map(TaskDto::new).collect(Collectors.toList());
    }
}
