package com.team08.todolist.dto;

import com.team08.todolist.DateTimeUtils;

import java.time.LocalDateTime;

public class CardDto {
    private Long cardId;
    private String title;
    private String content;
    private boolean isApp;
    private LocalDateTime createdDateTime;
    private Integer position;

    public CardDto(Long cardId, String title, String content, boolean isApp, LocalDateTime createdDateTime, Integer position) {
        this.cardId = cardId;
        this.title = title;
        this.content = content;
        this.isApp = isApp;
        this.createdDateTime = createdDateTime;
        this.position = position;
    }

    public Long getCardId() {
        return cardId;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public boolean getIsApp() {
        return isApp;
    }

    public String getCreatedTime() {
        return DateTimeUtils.formatByPattern(createdDateTime);
    }

    public Integer getPosition() {
        return position;
    }
}
