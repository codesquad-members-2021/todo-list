package com.team06.todo.dto;

import com.team06.todo.domain.Card;

import java.time.LocalDateTime;

public class CardResponseDto {

    private Long id;
    private String title;
    private String contents;
    private int columnType;
    private String createdDateTime;

    private CardResponseDto() {
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }

    public int getColumnType() {
        return columnType;
    }

    public String getCreatedDateTime() {
        return createdDateTime;
    }

    public static class Builder {
        private Long id;
        private String title;
        private String contents;
        private int columnType;
        private String createdDateTime;

        public Builder id(Long id) {
            this.id = id;
            return this;
        }

        public Builder title(String title) {
            this.title = title;
            return this;
        }

        public Builder contents(String contents) {
            this.contents = contents;
            return this;
        }

        public Builder columnType(int columnType) {
            this.columnType = columnType;
            return this;
        }

        public Builder createdDateTime(String createdDateTime) {
            this.createdDateTime = createdDateTime;
            return this;
        }

        public CardResponseDto build() {
            CardResponseDto cardResponseDto = new CardResponseDto();
            cardResponseDto.id = id;
            cardResponseDto.title = title;
            cardResponseDto.contents = contents;
            cardResponseDto.columnType = columnType;
            cardResponseDto.createdDateTime = createdDateTime;
            return cardResponseDto;
        }
    }

    public static CardResponseDto from(Card card) {
        return new CardResponseDto.Builder()
                .id(card.getId())
                .title(card.getTitle())
                .contents(card.getContents())
                .columnType(card.getColumnType())
                .createdDateTime(card.getCreatedDateTime())
                .build();
    }
}
