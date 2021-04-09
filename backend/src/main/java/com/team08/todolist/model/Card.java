package com.team08.todolist.model;

import com.team08.todolist.DateTimeUtils;

import java.time.LocalDateTime;

public class Card {

    private int cardId;
    private String author;
    private String title;
    private String content;
    private LocalDateTime createdDateTime;
    private boolean isApp;
    private int itemId;
    private int position;

    public Card(int cardId, String author, String title, String content, LocalDateTime createdDateTime, boolean isApp, int itemId, int position) {
        this.cardId = cardId;
        this.author = author;
        this.title = title;
        this.content = content;
        this.createdDateTime = createdDateTime;
        this.isApp = isApp;
        this.itemId = itemId;
        this.position = position;
    }

    public int getCardId() {
        return cardId;
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

    public int getItemId() {
        return itemId;
    }

    public int getPosition() {
        return position;
    }
}