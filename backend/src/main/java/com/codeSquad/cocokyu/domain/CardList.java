package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.card.Card;

import java.util.ArrayList;
import java.util.List;

public class CardList {
    private List<Card> todo = new ArrayList<>();
    private List<Card> doing = new ArrayList<>();
    private List<Card> done = new ArrayList<>();

    public CardList(Iterable<Card> cards) {
        divide(cards);
    }

    private void divide(Iterable<Card> cards) {
        for (Card card : cards) {
            sort(card);
        }
    }

    private void sort(Card card) {
        switch (card.getStatus()) {
            case TODO:
                todo.add(card);
                break;
            case DOING:
                doing.add(card);
                break;
            case DONE:
                done.add(card);
                break;
        }
    }

    public List<Card> getTodo() {
        return todo;
    }

    public List<Card> getDoing() {
        return doing;
    }

    public List<Card> getDone() {
        return done;
    }
}
