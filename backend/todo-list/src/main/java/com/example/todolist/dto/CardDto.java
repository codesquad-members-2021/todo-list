package com.example.todolist.dto;


import com.example.todolist.domain.User;

import java.time.LocalDateTime;

public class CardDto {
    private User user;
    private String title;
    private String contents;
    private LocalDateTime postTime;

    public CardDto() {

    }

    public CardDto(User user, String title, String contents, LocalDateTime postTime) {
        this.user = user;
        this.title = title;
        this.contents = contents;
        this.postTime = postTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public LocalDateTime getPostTime() {
        return postTime;
    }

    public void setPostTime(LocalDateTime postTime) {
        this.postTime = postTime;
    }
}
