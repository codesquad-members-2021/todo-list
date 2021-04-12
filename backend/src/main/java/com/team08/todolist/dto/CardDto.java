package com.team08.todolist.dto;

import com.team08.todolist.DateTimeUtils;

import java.time.LocalDateTime;

import static com.team08.todolist.DateTimeUtils.reformatByPattern;

public class CardDto {
    private Long cardId;
    private String title;
    private String content;
    private boolean isApp;
    private LocalDateTime createdDateTime;
    private Integer position;

    public CardDto(Long cardId, String title, String content, boolean isApp, String createdTime, Integer position) {
        this.cardId = cardId;
        this.title = title;
        this.content = content;
        this.isApp = isApp;
        this.createdDateTime = reformatByPattern(createdTime);
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

    @Override
    public String toString() {
        return "CardDto{" +
                "cardId=" + cardId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", isApp=" + isApp +
                ", createdDateTime=" + createdDateTime +
                ", position=" + position +
                '}';
    }
}
