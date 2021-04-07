package com.example.todolist.domain;

import org.springframework.data.annotation.Id;

public class Card {
    @Id
    private Long id;

    private User user;
    private String title;
    private String contents;
    private String status;

    public Card(User user, String title, String contents, String status) {
        this.user = user;
        this.title = title;
        this.contents = contents;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public User getUser(){
        return user;
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
