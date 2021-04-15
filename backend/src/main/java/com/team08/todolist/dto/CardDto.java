package com.team08.todolist.dto;

import com.team08.todolist.DateTimeUtils;
import com.team08.todolist.model.Card;

import java.time.LocalDateTime;

import static com.team08.todolist.DateTimeUtils.reformatByPattern;

public class CardDto {
    private Long cardId;
    private String title;
    private String content;
    private boolean isApp;
    private LocalDateTime createdDateTime;
    private Integer position;
    private Long columnId;

    public CardDto(Long cardId, String title, String content, boolean isApp, String createdTime, Integer position, Long columnId) {
        this.cardId = cardId;
        this.title = title;
        this.content = content;
        this.isApp = isApp;
        this.createdDateTime = reformatByPattern(createdTime);
        this.position = position;
        this.columnId = columnId;
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

    public Long getColumnId() {
        return columnId;
    }

    public Card toEntity() {
        return new Card(null, "august17", title, content, createdDateTime, isApp, columnId, position);
    }

    public static CardDto of(Card card) {
        return new CardDto(card.getCid(), card.getTitle(), card.getContent(), card.getIsapp(), card.getDate(), card.getPos(), card.getColumnid());
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
