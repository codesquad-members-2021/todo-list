package com.team06.todo.domain;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;
import java.util.Objects;

public class Action {
    @Id
    private Long id;

    private ActionType actionType;
    private String cardTitle;

    @CreatedDate
    private LocalDateTime createdDateTime;

    // move 할 때
    private int columnFrom;
    private int columnTo;

    public Action() {
    }

    // move
    public Action(String cardTitle, int columnFrom, int columnTo, ActionType actionType) {
        this.cardTitle = cardTitle;
        this.actionType = actionType;
        this.columnFrom = columnFrom;
        this.columnTo = columnTo;
    }

    // add, update, delete
    public Action(String cardTitle, ActionType actionType) {
        this.cardTitle = cardTitle;
        this.actionType = actionType;
    }

    public Long getId() {
        return id;
    }

    public ActionType getActionType() {
        return actionType;
    }

    public String getCardTitle() {
        return cardTitle;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

    public int getColumnFrom() {
        return columnFrom;
    }

    public int getColumnTo() {
        return columnTo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Action)) return false;
        Action action = (Action) o;
        return Objects.equals(getId(), action.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }

    @Override
    public String toString() {
        return "Action{" +
                "id=" + id +
                ", actionType=" + actionType +
                ", cardTitle=" + cardTitle +
                ", createdDateTime=" + createdDateTime +
                ", columnFrom=" + columnFrom +
                ", columnTo=" + columnTo +
                '}';
    }
}
