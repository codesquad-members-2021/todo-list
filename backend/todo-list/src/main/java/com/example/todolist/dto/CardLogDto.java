package com.example.todolist.dto;

import com.example.todolist.domain.Card;
import com.example.todolist.domain.User;

import java.time.LocalDateTime;

public class CardLogDto {
    private User user;
    private String title;

    public CardLogDto(User user, String title) {
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
