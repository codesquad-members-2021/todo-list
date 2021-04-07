package com.team13.todolist.model;

import org.springframework.data.annotation.Id;

public class Card {
    @Id
    private Long id;

    private String title;
    private String body;

    private Long columnId;
    private Long authorId;

    public Card(String title, String body, Long columnId, Long authorId) {
        this.title = title;
        this.body = body;
        this.columnId = columnId;
        this.authorId = authorId;
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", body='" + body + '\'' +
                ", columnId=" + columnId +
                ", authorId=" + authorId +
                '}';
    }
}
