package com.team06.todo.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Action {
    @Id
    private Long id;

    private ActionType actionType;
    private String cardTitle;
    private LocalDateTime createdDateTime;

    // move 할 때
    private ColumnType columnFrom;
    private ColumnType columnTo;

    public Action() {
    }

    // move
    public Action(String cardTitle, ColumnType columnFrom, ColumnType columnTo, ActionType actionType) {
        this.cardTitle = cardTitle;
        this.actionType = actionType;
        this.columnFrom = columnFrom;
        this.columnTo = columnTo;
        this.createdDateTime = LocalDateTime.now();
    }

    // add, update, delete
    public Action(String cardTitle, ActionType actionType) {
        this.cardTitle = cardTitle;
        this.actionType = actionType;
        this.createdDateTime = LocalDateTime.now();
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

    public ColumnType getColumnFrom() {
        return columnFrom;
    }

    public ColumnType getColumnTo() {
        return columnTo;
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
