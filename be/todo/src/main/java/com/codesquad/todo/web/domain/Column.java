package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.service.dto.TaskDto;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Column {
    private Long id;
    private String columnTitle;
    private User author;
    private List<Task> taskList;

    public Column(long id, String columnTitle, List<Task> taskList) {
        this.id = id;
        this.columnTitle = columnTitle;
        this.taskList = taskList;
    }

    public Column(long id, String columnTitle) {
        this(id, columnTitle, new ArrayList<>());
    }

    public void addTask(Task task) {
        taskList.add(task);
    }

    public List<TaskDto> convertTaskListToTaskDtoList() {
        return taskList.stream().map(task -> new TaskDto(task, author.getName())).collect(Collectors.toList());
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

    public List<Task> getTaskList() {
        return taskList;
    }

    public void setTaskList(List<Task> taskList) {
        this.taskList = taskList;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }
}
