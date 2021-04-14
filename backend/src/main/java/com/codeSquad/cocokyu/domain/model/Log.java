package com.codeSquad.cocokyu.domain.model;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Log {

    @Id
    private Long id;

    private String title;
    private Status fromStatus;
    private Status toStatus;
    private Action action;
    private LocalDateTime createDateTime;

    protected Log() {
    }

    public Log(Card card, Status toStatus, Action action) {
        this.title = card.getTitle();
        this.fromStatus = card.getStatus();
        this.toStatus = toStatus;
        this.action = action;
        createDateTime = LocalDateTime.now();
    }

    public Log(Card card, Action action) {
        this.title = card.getTitle();
        this.fromStatus = card.getStatus();
        this.action = action;
        createDateTime = LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public Status getFromStatus() {
        return fromStatus;
    }

    public Status getToStatus() {
        return toStatus;
    }

    public Action getAction() {
        return action;
    }

    public LocalDateTime getCreateDateTime() {
        return createDateTime;
    }

    public enum Action {
        MOVE, DELETED, CREATE
    }
}
