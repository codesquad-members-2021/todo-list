package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.card.Card;

import java.util.ArrayList;
import java.util.List;

public class CardList {
    private List<Card> todos = new ArrayList<>();
    private List<Card> doings = new ArrayList<>();
    private List<Card> dones = new ArrayList<>();

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
                todos.add(card);
                break;
            case DOING:
                doings.add(card);
                break;
            case DONE:
                dones.add(card);
                break;
        }
    }

    public List<Card> getTodos() {
        return todos;
    }

    public List<Card> getDoings() {
        return doings;
    }

    public List<Card> getDones() {
        return dones;
    }
}
