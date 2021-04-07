package com.example.todolist.domain;

import com.example.todolist.domain.Card;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.MappedCollection;

import java.util.ArrayList;
import java.util.List;

public class User {
    @Id
    private Long id;

    private String name;
    private String password;

    @MappedCollection(idColumn = "user")
    private List<Card> cards = new ArrayList<>();

    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public List<Card> getCards() {
        return cards;
    }
}
