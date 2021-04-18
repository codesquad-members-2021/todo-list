package com.codesquad.todoList.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.PersistenceConstructor;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

@Getter
@Setter
@Table(value = "CARD")
public class Card {

    @Id
    private String id;

    @NotBlank(message = "Card 의 제목은 비어 있을 수 없습니다.")
    @Size(max = 50, message = "Card 의 제목은 50자 미만입니다.")
    private String title;

    @NotBlank(message = "Card 의 내용은 비어 있을 수 없습니다.")
    @Size(max = 500, message = "Card 의 내용은 500 자 미만 입니다.")
    private String content;

    @NotBlank(message = "작가의 이름은 비어 있을 수 없습니다.")
    @Size(max = 30, message = "작가의 이름은 30자 미만입니다.")
    private String author;

    private Long columns;

    @Column(value = "CREATE_DATETIME")
    private LocalDateTime createDateTime = LocalDateTime.now();

    @Column(value = "UPDATE_DATETIME")
    private LocalDateTime updateDateTime = LocalDateTime.now();

    @PersistenceConstructor
    public Card(String title, String content, String author) {
        this.id = UUID.randomUUID().toString();
        this.title = title;
        this.content = content;
        this.author = author;
        this.updateDateTime = LocalDateTime.now();
    }

    public static Card of(String title, String content, String author) {
        return new Card(title, content, author);
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
