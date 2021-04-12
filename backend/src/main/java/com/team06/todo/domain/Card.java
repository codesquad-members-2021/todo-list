package com.team06.todo.domain;

import com.team06.todo.dto.CardCreateRequestDto;
import com.team06.todo.dto.CardMoveRequestDto;
import com.team06.todo.dto.CardUpdateRequestDto;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;
import java.util.Objects;

public class Card {
    @Id
    private Long id;

    private String title;
    private String contents;
    // colunmType 할 일(0), 하는 중(1), 마친 일(2)
    private int columnType;
    private LocalDateTime createdDateTime;

    public Card() {
    }

    public Card(CardCreateRequestDto cardCreateRequestDto){
        this.title = cardCreateRequestDto.getTitle();
        this.contents = cardCreateRequestDto.getContents();
        this.columnType = cardCreateRequestDto.getColumnType();
        this.createdDateTime = LocalDateTime.now();
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

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

    public void update(CardUpdateRequestDto cardUpdateRequestDto) {
        this.title = cardUpdateRequestDto.getTitle();
        this.contents = cardUpdateRequestDto.getContents();
    }

    public void move(CardMoveRequestDto cardMoveRequestDto) {
        this.columnType = cardMoveRequestDto.getColumnType();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Card)) return false;
        Card card = (Card) o;
        return Objects.equals(getId(), card.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", columnType=" + columnType +
                ", createdDateTime=" + createdDateTime +
                '}';
    }
}
