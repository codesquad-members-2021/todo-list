package com.example.todolist.dto;

import com.example.todolist.domain.User;

public class CardLogDTO {
    private User user;
    private String title;

    public CardLogDTO(User user, String title) {
        this.user = user;
        this.title = title;
    }

    public User getUser() {
        return user;
    }

    public String getTitle() {
        return title;
    }
}
