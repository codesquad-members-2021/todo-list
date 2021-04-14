package com.team08.todolist.model;

import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Column {
    @Id
    private Long columnid;
    private String title;
    private Integer pos;
    private Integer count;
    private Set<Card> cards = new HashSet<>();

    public Column(Long columnid, String title, Integer pos, Integer count, Set<Card> cards) {
        this.columnid = columnid;
        this.title = title;
        this.pos = pos;
        this.count = count;
        this.cards = cards;
    }

    public Long getColumnid() {
        return columnid;
    }

    public String getTitle() {
        return title;
    }

    public Integer getPos() {
        return pos;
    }

    public Integer getCount() {
        return count;
    }

    public Set<Card> getCards() {
        return cards;
    }

    public void addCard(Card card) {
        cards.add(card);
    }
}
