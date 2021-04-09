package com.team08.todolist.model;

import com.team08.todolist.DateTimeUtils;

import java.time.LocalDateTime;

public class History {

    private Integer historyId;
    private Integer cardId;
    private String author;
    private String title;
    private String action;
    private String from;
    private String to;
    private LocalDateTime createdDateTime;

    public History(Integer historyId, Integer cardId, String author, String title, String action, String from, String to, LocalDateTime createdDateTime) {
        this.historyId = historyId;
        this.cardId = cardId;
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

    public Integer getCardId() {
        return cardId;
    }

    public String getAuthor() {
        return author;
    }

    public String getTitle() {
        return title;
    }

    public String getAction() {
        return action;
    }

    public String getFrom() {
        return from;
    }

    public String getTo() {
        return to;
    }

    public String getCreatedDateTime() {
        return DateTimeUtils.formatByPattern(createdDateTime);
    }

}



