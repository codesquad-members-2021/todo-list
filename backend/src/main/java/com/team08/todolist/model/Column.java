package com.team08.todolist.model;

public class Column {

    private Long id;
    private String title;
    private Integer position;
    private Integer count;

    public Column(Long id, String title, Integer position, Integer count) {
        this.id = id;
        this.title = title;
        this.position = position;
        this.count = count;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public Integer getPosition() {
        return position;
    }

    public Integer getCount() {
        return count;
    }
}
