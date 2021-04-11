package com.codesquad.todo.web.domain;

import java.util.ArrayList;
import java.util.List;

public class Column {
    private Long id;
    private String columnTitle;
    private List<Task> taskList;

    public Column(Long id, String columnTitle) {
        this.id = id;
        this.columnTitle = columnTitle;
        taskList = new ArrayList<>();
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
}
