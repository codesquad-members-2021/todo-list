package com.team13.todolist.model;

import org.springframework.data.annotation.Id;

public class Card {
    @Id
    private Long id;

    private String title;
    private String body;

    private Long columnId;

    Card(Long id, String title, String body, Long columnId) {
        this.id = id;
        this.title = title;
        this.body = body;
        this.columnId = columnId;
    }

    public static Card create(String title, String body, Long columnId) {
        return new Card(null, title, body, columnId);
    }

    public static Card create(Long id, String title, String body, Long columnId) {
        return new Card(id, title, body, columnId);
    }

    public Long getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", body='" + body + '\'' +
                ", columnId=" + columnId +
                '}';
    }

    public void update(Card updateCardInfo) {
        this.title = updateCardInfo.title;
        this.body = updateCardInfo.body;
        this.columnId = updateCardInfo.columnId;
    }
}
