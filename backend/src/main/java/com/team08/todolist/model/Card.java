package com.team08.todolist.model;

import com.team08.todolist.DateTimeUtils;

import java.time.LocalDateTime;

public class Card {

    private Long id;
    private String author;
    private String title;
    private String content;
    private LocalDateTime createdDateTime;
    private boolean isApp;
    private Long columnId;
    private Integer position;

    public Card(Long id, String author, String title, String content, LocalDateTime createdDateTime, boolean isApp, Long columnId, Integer position) {
        this.id = id;
        this.author = author;
        this.title = title;
        this.content = content;
        this.createdDateTime = createdDateTime;
        this.isApp = isApp;
        this.columnId = columnId;
        this.position = position;
    }

    public Long getId() {
        return id;
    }

    public String getAuthor() {
        return author;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getCreatedDateTime() {
        return DateTimeUtils.formatByPattern(createdDateTime);
    }

    public boolean getIsApp() {
        return isApp;
    }

    public Long getColumnId() {
        return columnId;
    }

    public Integer getPosition() {
        return position;
    }
}