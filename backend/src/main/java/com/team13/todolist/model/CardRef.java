package com.team13.todolist.model;

import org.springframework.data.relational.core.mapping.Table;

import java.util.Objects;

@Table("COLUMN_CARD")
public class CardRef {
    Long card;

    CardRef(Long card) {
        this.card = card;
    }

    public static CardRef of(Long cardId) {
        return new CardRef(cardId);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CardRef cardRef = (CardRef) o;
        return Objects.equals(card, cardRef.card);
    }

    @Override
    public int hashCode() {
        return Objects.hash(card);
    }
}
