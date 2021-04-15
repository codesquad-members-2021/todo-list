package com.example.todolist.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.data.annotation.Id;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.Objects;

public class Card {
    public static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm";

    @Id
    private Long id;

    private Long userId;

    @NotBlank
    private String title;

    @NotBlank
    private String contents;

    private String status;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = DATETIME_FORMAT, timezone = "Asia/Seoul")
    private LocalDateTime postTime;

    private boolean isDeleted;

    protected Card() {
    }

    public Card(User user, String title, String contents, String status) {
        this.userId = user.getUserId();
        this.title = title;
        this.contents = contents;
        this.status = status;
        this.postTime = LocalDateTime.now();
        this.isDeleted = false;
    }

    public void updateStatus(Card card) {
        this.status = card.status;
    }

    public void update(Card newCardInfo) {
        this.title = newCardInfo.title;
        this.contents = newCardInfo.contents;
    }

    public void update(String title, String contents) {
        this.title = title;
        this.contents = contents;
    }

    public Object[] cardInfo() {
        return new Object[]{id, userId, title, contents, postTime};
    }

    public void delete() {
        this.isDeleted = true;
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

    public boolean isValidUser(User user) {
        return this.userId.equals(user.getUserId());
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
