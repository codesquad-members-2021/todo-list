package com.team13.todolist.model;

import org.springframework.data.annotation.Id;

import java.util.Map;

public class Column {
    @Id
    private final Long id;

    private String name;
    private Map<Long, CardRef> cards;

    Column(Long id, String name, Map<Long, CardRef> cards) {
        this.id = id;
        this.name = name;
        this.cards = cards;
    }

    public static Column of(String name, Map<Long, CardRef> cards) {
        return new Column(null, name, cards);
    }

    private CardRef createCardRef(Card card) {
        CardRef cardRef = new CardRef();
        cardRef.card = card.getId();
        return cardRef;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Map<Long, CardRef> getCards() {
        return cards;
    }

    public void addCard(Card card) {
        CardRef lastCard = cards.get(0L);
        cards.put(0L, createCardRef(card));
        if (lastCard != null) {
            cards.put(card.getId(), lastCard);
        }
    }

    public void addCard(Long prevCardId, Card card) {
        CardRef nextCard = cards.get(prevCardId);
        if (nextCard != null) {
            cards.put(card.getId(), nextCard);
        }
        // prevCardId must be checked whether it exist in Column card list
        cards.put(prevCardId, createCardRef(card));
    }
}
