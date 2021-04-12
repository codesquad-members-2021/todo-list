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
        return CardRef.of(card.getId());
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
        addCard(0L, card);
    }

    public void addCard(Long prevCardId, Card card) {
        if (!(cards.containsKey(prevCardId) || prevCardId.equals(0L))) {
            checkCardListContains(prevCardId);
        }
        CardRef nextCard = cards.put(prevCardId, createCardRef(card));
        if (nextCard != null) {
            cards.putIfAbsent(card.getId(), nextCard);
        }
    }

    public void removeCard(Long cardId) {
        Long prevCardId = findPrevCardId(cardId);
        cards.remove(prevCardId);
        CardRef nextCard = cards.remove(cardId);
        if (nextCard != null) {
            cards.put(prevCardId, nextCard);
        }
    }

    private Long findPrevCardId(Long cardId) {
        CardRef cardRef = CardRef.of(cardId);
        for (Map.Entry<Long, CardRef> entry : cards.entrySet()) {
            if (entry.getValue().equals(cardRef)) {
                return entry.getKey();
            }
        }
        throw new RuntimeException("Not Found");
    }

    private void checkCardListContains(Long cardId) {
        if (!cards.containsValue(CardRef.of(cardId))) {
            // TODO: Throw prefer exception
            throw new RuntimeException("Not Found");
        }
    }
}
