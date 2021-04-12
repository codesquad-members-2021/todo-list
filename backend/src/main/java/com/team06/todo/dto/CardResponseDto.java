package com.team06.todo.dto;

import com.team06.todo.domain.Card;
import com.team06.todo.domain.ColumnType;

import java.time.LocalDateTime;

public class CardResponseDto {

    private Long id;
    private String title;
    private String contents;
    private ColumnType columnType;
    private LocalDateTime createdDateTime;

    protected CardResponseDto() {

    }

    public CardResponseDto(Card card) {
        this.id = card.getId();
        this.title = card.getTitle();
        this.contents = card.getContents();
        this.columnType = card.getColumnType();
        this.createdDateTime = card.getCreatedDateTime();
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

    public ColumnType getColumnType() {
        return columnType;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

}
