package mj_cooper.backend.domain;

import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;
import java.util.function.LongToDoubleFunction;

public class Category {

    @Id
    private Long categoryId;
    private List<Card> cards = new ArrayList<>();

    public Category() {
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public List<Card> getCards() {
        return cards;
    }

    public Card getCard(Long id) {
        return cards.get(Math.toIntExact(id) - 1);
    }

    public void deleteCard(Long id) {
        cards.remove(Math.toIntExact(id) - 1);
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }


    public boolean addCard(Card card) {
        return this.cards.add(card);
    }

    @Override
    public String toString() {
        return "Vertical{" +
                "id=" + categoryId +
                ", todos=" + cards +
                '}';
    }
}

