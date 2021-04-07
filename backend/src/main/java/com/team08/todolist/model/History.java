package com.team08.todolist.model;

import com.team08.todolist.DateTimeUtils;

import java.time.LocalDateTime;

public class History {

    private Integer historyId;
    private String author;
    private String title;
    private Integer action;
    private Integer from;
    private Integer to;
    private LocalDateTime createdDateTime;

    public History(Integer historyId, String author, String title, Integer action, Integer from, Integer to, LocalDateTime createdDateTime) {
        this.historyId = historyId;
        this.author = author;
        this.title = title;
        this.action = action;
        this.from = from;
        this.to = to;
        this.createdDateTime = createdDateTime;
    }

    public Integer getHistoryId() {
        return historyId;
    }

    public String getAuthor() {
        return author;
    }

    public String getTitle() {
        return title;
    }

    public Integer getAction() {
        return action;
    }

    public Integer getFrom() {
        return from;
    }

    public Integer getTo() {
        return to;
    }

    public String getCreatedDateTime() {
        return DateTimeUtils.formatByPattern(createdDateTime);
    }

}



