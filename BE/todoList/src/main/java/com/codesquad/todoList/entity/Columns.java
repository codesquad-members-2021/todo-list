package com.codesquad.todoList.entity;

import com.codesquad.todoList.error.exception.NotFoundCardException;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
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

    public Card deleteCard(String cardId) {
        Card card = null;
        for(Card originalCard : cardList) {
            if(originalCard.getId().equals(cardId)) {
                card = originalCard;
                cardList.remove(originalCard);
                return card;
            }
        }
        throw new NotFoundCardException();
    }

    public void updateColumn(Columns columns) {
        this.name = columns.name;
        this.cardList = columns.cardList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Columns)) return false;
        Columns columns = (Columns) o;
        return Objects.equals(id, columns.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
