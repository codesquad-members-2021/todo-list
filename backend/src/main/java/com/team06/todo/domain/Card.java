package com.team06.todo.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Objects;

public class Card {
    @Id
    Long id;

    String title;
    String contents;
    ColumnId column_id;
    LocalDateTime created_date_time;

    public Card() {
    }

    public Card(HashMap<String, String> cardInfo) {
        this.title = cardInfo.get("title");
        this.contents = cardInfo.get("contents");
        this.column_id = ColumnId.valueOf(cardInfo.get("column_id"));
        this.created_date_time = LocalDateTime.now();
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

    public ColumnId getColumn_id() {
        return column_id;
    }

    public LocalDateTime getCreated_date_time() {
        return created_date_time;
    }

    public void update(HashMap<String, String> cardInfo) {
        this.title = cardInfo.get("title");
        this.contents = cardInfo.get("contents");
    }

    public void move(HashMap<String, String> cardInfo) {
        this.column_id = ColumnId.valueOf(cardInfo.get("column_id"));
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
}
