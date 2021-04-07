package com.example.todolist;

import org.springframework.data.annotation.Id;

public class Card {
    @Id
    private Long id;

    private String title;
    private String contents;
    private String status;

    public Card(String title, String contents, String status) {
        this.title = title;
        this.contents = contents;
        this.status = status;
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

    public String getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return "Card{" +
                "title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
