package com.team08.todolist.dto;

import com.team08.todolist.util.DateTimeUtils;
import com.team08.todolist.model.Card;

import java.time.LocalDateTime;

import static com.team08.todolist.util.DateTimeUtils.reformatByPattern;

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
        return Card.build(null, position, columnId)
                .author("august17")
                .title(title)
                .content(content)
                .date(createdDateTime)
                .isApp(isApp)
                .build();
    }

    public static CardDto of(Card card) {
        return CardDto.build(card.getCid(), card.getPos(), card.getColumnId())
                .title(card.getTitle())
                .content(card.getTitle())
                .isApp(card.isApp())
                .createdDateTime(card.getDate())
                .build();
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

    public static Builder build(Long cardId, Integer position, Long columnId) {
        return new Builder(cardId, position, columnId);
    }

    static public class Builder {
        private Long cardId;
        private String title = "no title";
        private String content = "no contents";
        private boolean isApp = true;
        private LocalDateTime createdDateTime = LocalDateTime.now();
        private Integer position;
        private Long columnId;

        private Builder(Long cardId, Integer position, Long columnId) {
            this.cardId = cardId;
            this.position = position;
            this.columnId = columnId;
        }

        public Builder title(String title) {
            this.title = title;
            return this;
        }

        public Builder content(String content) {
            this.content = content;
            return this;
        }

        public Builder isApp(boolean isApp) {
            this.isApp = isApp;
            return this;
        }

        public Builder createdDateTime(LocalDateTime createdDateTime) {
            this.createdDateTime = createdDateTime;
            return this;
        }

        public CardDto build() {
            return new CardDto(cardId, title, content, isApp, DateTimeUtils.formatByPattern(createdDateTime), position, columnId);
        }
    }
}
