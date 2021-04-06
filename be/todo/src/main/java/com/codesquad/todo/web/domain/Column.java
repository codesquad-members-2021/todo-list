package com.codesquad.todo.web.domain;

import java.util.List;

public class Column {
    private final long id;
    private final String columnTitle;
    private List<Task> taskList;

    public Column(long id, String columnTitle) {
        this.id = id;
        this.columnTitle = columnTitle;
    }

    public long getId() {
        return id;
    }

    public String getColumnTitle() {
        return columnTitle;
    }

    public List<Task> getTaskList() {
        return taskList;
    }
}
