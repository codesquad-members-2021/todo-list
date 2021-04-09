package com.codeSquad.cocokyu.domain.model;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Card {
    @Id
    private Long id;

    private String title;
    private String contents;
    private LocalDateTime createDateTime;
    private Status status;

    private Logs logs = new Logs();

    protected Card() {
    }

    public Card(String title, String contents, Status status) {
        this.title = title;
        this.contents = contents;
        this.status = status;
        this.createDateTime = LocalDateTime.now();
        logs.createLog(this);
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

    public Status getStatus() {
        return status;
    }

    public LocalDateTime getCreateDateTime() {
        return createDateTime;
    }

    public void modify(Card updateCard) {
        logs.updateLog(this, updateCard);
        this.title = updateCard.title;
        this.contents = updateCard.contents;
        this.status = updateCard.status;
    }

    public void delete() {
        logs.deleteLog(this);
        this.status = Status.DELETED;
    }

    public enum Status {
        TODO,
        DOING,
        DONE,
        DELETED
    }
}
