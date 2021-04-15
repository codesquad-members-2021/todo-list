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


    public List<Card> getTodos() {
        return cards;
    }

    public Card getTodo(Long id) {
        return cards.get(Math.toIntExact(id) - 1);
    }

    public void deleteTodo(Long id) {
        cards.remove(Math.toIntExact(id) - 1);
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }


    public boolean addTodo(Card card) {

        System.out.println("test in catergory Card: " + card.toString());
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

