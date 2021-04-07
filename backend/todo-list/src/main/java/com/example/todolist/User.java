package com.example.todolist;

import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

public class User {
    @Id
    private Long id;

    private String name;
    private String password;
    private List<Card> cards = new ArrayList<>();

    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }
}
