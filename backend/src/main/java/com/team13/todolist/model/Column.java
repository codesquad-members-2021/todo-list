package com.team13.todolist.model;

import org.springframework.data.annotation.Id;

import java.util.List;

public class Column {
    @Id
    private final Long id;

    private String name;
    private List<Card> cards;

    public Column(Long id, String name, List<Card> cards) {
        this.id = id;
        this.name = name;
        this.cards = cards;
    }

    public static Column of(String name, List<Card> cards) {
        return new Column(null, name, cards);
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public List<Card> getCards() {
        return cards;
    }
}
