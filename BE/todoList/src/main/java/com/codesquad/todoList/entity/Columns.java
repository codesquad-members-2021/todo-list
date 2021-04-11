package com.codesquad.todoList.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.*;

@Getter
@Setter
@NoArgsConstructor
@Table(value = "COLUMNS")
public class Columns {

    @Id
    private Long id;

    @NotBlank(message = "콜럼의 이름은 비어 있을 수 없습니다.")
    @Size(max = 50, message = "콜럼의 이름은 최대 50자 미만입니다.")
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
