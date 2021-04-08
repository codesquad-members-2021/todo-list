package com.team13.todolist.model;

import org.springframework.data.annotation.Id;

import java.util.List;

public class ToDoList {

    @Id
    private Long id;

    private String name;
    private List<Column> columns;

    public ToDoList(Long id, String name, List<Column> columns) {
        this.id = id;
        this.name = name;
        this.columns = columns;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public List<Column> getColumns() {
        return columns;
    }

    public static ToDoList of(String name, List<Column> columns) {
        return new ToDoList(null, name, columns);
    }

}
