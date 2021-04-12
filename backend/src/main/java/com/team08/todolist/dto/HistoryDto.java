package com.team08.todolist.dto;

import com.team08.todolist.DateTimeUtils;

import java.time.LocalDateTime;

public class HistoryDto {

    private String author;
    private LocalDateTime createdDateTime;
    private String title;
    private String action;
    private String from;
    private String to;

    public HistoryDto(String author, LocalDateTime createdDateTime, String title, String action, String from, String to) {
        this.author = author;
        this.createdDateTime = createdDateTime;
        this.title = title;
        this.action = action;
        this.from = from;
        this.to = to;
    }

    public String getAuthor() {
        return author;
    }

    public String getDate() {
        return DateTimeUtils.formatByPattern(createdDateTime);
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
}

