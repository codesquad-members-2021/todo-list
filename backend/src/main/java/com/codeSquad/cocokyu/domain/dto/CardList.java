package com.codeSquad.cocokyu.domain.dto;

import com.codeSquad.cocokyu.domain.model.Card;

import java.util.ArrayList;
import java.util.List;

public class CardList {
    private List<Card> todo;
    private List<Card> doing;
    private List<Card> done;

    private CardList(Builder builder) {
        this.todo = builder.todo;
        this.doing = builder.doing;
        this.done = builder.done;
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

    public static class Builder {
        private List<Card> todo = new ArrayList<>();
        private List<Card> doing = new ArrayList<>();
        private List<Card> done = new ArrayList<>();

        public Builder() {
        }

        public CardList build() {
            return new CardList(this);
        }

        public Builder addCard(Card card) {
            if (card.isTodo()) {
                todo.add(card);
                return this;
            }
            if (card.isDoing()) {
                doing.add(card);
                return this;
            }
            done.add(card);
            return this;
        }
    }
}
