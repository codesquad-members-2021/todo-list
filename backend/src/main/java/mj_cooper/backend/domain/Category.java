package mj_cooper.backend.domain;

import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

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
        cards.remove(cards.get(Math.toIntExact(id) - 1));
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }


    public boolean addTodo(Card card) {
        return this.cards.add(card);
    }
//
//    public void update(Vertical vertical) {
//        this.todos = vertical.getTodos();
//    }
//
    @Override
    public String toString() {
        return "Vertical{" +
                "id=" + categoryId +
                ", todos=" + cards +
                '}';
    }
}

