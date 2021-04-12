package com.example.todolist.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;

import java.time.LocalDateTime;
import java.util.Objects;

public class Card {

    @Id
    private Long id;

    private Long userId;
    private String title;
    private String contents;
    private String status;
    private LocalDateTime postTime;

    public Card() {

    }

    public Card(User user, String title, String contents, String status) {
        this.userId = user.getUserId();
        this.title = title;
        this.contents = contents;
        this.status = status;
        this.postTime = LocalDateTime.now();
    }

    public void update(String title, String contents) {
        this.title = title;
        this.contents = contents;
    }

    public LocalDateTime getPostTime() {
        return postTime;
    }

    public Long getUserId() {
        return userId;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }

    public String getStatus() {
        return status;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Card card = (Card) o;
        return Objects.equals(id, card.id) && Objects.equals(title, card.title) && Objects.equals(contents, card.contents) && Objects.equals(status, card.status);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title, contents, status);
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
