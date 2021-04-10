package com.team06.todo.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Objects;

public class Card {
    @Id
    private Long id;

    private String title;
    private String contents;
    private ColumnType columnType;
    private LocalDateTime createdDateTime;

    public Card() {
    }

    public Card(HashMap<String, String> cardInfo) {
        this.title = cardInfo.get("title");
        this.contents = cardInfo.get("contents");
        this.columnType = ColumnType.valueOf(cardInfo.get("column_type"));
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

    public ColumnType getColumnType() {
        return columnType;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

    public void update(HashMap<String, String> cardInfo) {
        this.title = cardInfo.get("title");
        this.contents = cardInfo.get("contents");
    }

    public void move(HashMap<String, String> cardInfo) {
        this.columnType = ColumnType.valueOf(cardInfo.get("column_type"));
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
