package com.codesquad.todoList.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.MappedCollection;
import org.springframework.data.relational.core.mapping.Table;

import javax.validation.constraints.Size;
import java.util.*;

@Getter
@Setter
@NoArgsConstructor
@Table(value = "COLUMNS")
public class Columns {

    @Id
    private Long id;

    @Size(max = 50)
    private String name;

    private List<Card> cardList = new ArrayList<>();

    public Columns(String name) {
        this.name = name;
    }

    public void addCard(Card card) {
        cardList.add(card);
    }

    public void deleteCard(Long cardId) {
        cardList.removeIf(card -> card.getId().equals(cardId));
    }

    public void updateColumn(Columns columns) {
        this.name = columns.name;
    }

}
