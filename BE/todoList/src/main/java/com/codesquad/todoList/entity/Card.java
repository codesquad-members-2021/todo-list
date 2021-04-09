package com.codesquad.todoList.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import javax.validation.constraints.Max;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.Objects;

@Getter
@Setter
@Table(value = "CARD")
public class Card {

    @Id
    private final Long id;

    @Size(max = 50)
    private String title;

    @Size(max = 500)
    private String content;

    @Size(max = 30)
    private String author;

    @Column(value = "CREATE_DATETIME")
    private LocalDateTime createDateTime = LocalDateTime.now();

    @Column(value = "UPDATE_DATETIME")
    private LocalDateTime updateDateTime = LocalDateTime.now();

    public Card(Long id, String title, String content, String author) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
        this.updateDateTime = LocalDateTime.now();
    }

    public static Card of(String title, String content, String author) {
        return new Card(null, title, content, author);
    }

    public Card update(Card updateCard) {
        this.title = updateCard.title;
        this.content = updateCard.content;
        this.author = updateCard.author;
        return this;
    }

    public void setCreateDateTime(LocalDateTime createDateTime) {
        this.createDateTime = createDateTime;
    }

    public void setUpdateDateTime(LocalDateTime updateDateTime) {
        this.updateDateTime = updateDateTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Card)) return false;
        Card card = (Card) o;
        return Objects.equals(id, card.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}
