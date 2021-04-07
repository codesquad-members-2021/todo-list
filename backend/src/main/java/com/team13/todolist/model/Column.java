package com.team13.todolist.model;

import org.springframework.data.annotation.Id;

public class Column {
    @Id
    Long id;

    String name;

    public Column(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
