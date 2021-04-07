package com.team08.todolist.model;

import com.team08.todolist.DateTimeUtils;

import java.time.LocalDateTime;

public class Card {

    private int id;
    private String author;
    private String title;
    private String content;
    private LocalDateTime createdDateTime;
    private boolean isApp;
    private int column;
    private int prevCardId;

    public Card(int id, String author, String title, String content, LocalDateTime createdDateTime, boolean isApp, int column, int prevCardId) {
        this.id = id;
        this.author = author;
        this.title = title;
        this.content = content;
        this.createdDateTime = createdDateTime;
        this.isApp = isApp;
        this.column = column;
        this.prevCardId = prevCardId;
    }

    public int getId() {
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

    public boolean isApp() {
        return isApp;
    }

    public int getColumn() {
        return column;
    }

    public int getPrevCardId() {
        return prevCardId;
    }
}