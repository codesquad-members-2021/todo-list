package com.team06.todo.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Action {
    @Id
    private Long id;

    private ActionType actionType;
    private Long cardId;
    private LocalDateTime createdDateTime;

    // move 할 때
    private ColumnType columnFrom;
    private ColumnType columnTo;

    public Action() {
    }

    // add, update, delete
    public Action(Long cardId, ActionType actionType) {
        this.cardId = cardId;
        this.actionType = actionType;
        this.createdDateTime = LocalDateTime.now();
    }

    // move
    public Action(Long cardId, ColumnType columnFrom, ColumnType columnTo, ActionType actionType) {
        this.cardId= cardId;
        this.actionType = actionType;
        this.columnFrom = columnFrom;
        this.columnTo = columnTo;
        this.createdDateTime = LocalDateTime.now();
    }

    public enum ActionType {
        ADD,
        REMOVE,
        UPDATE,
        MOVE
    }

    @Override
    public String toString() {
        return "Action{" +
                "id=" + id +
                ", actionType=" + actionType +
                ", cardId=" + cardId +
                ", createdDateTime=" + createdDateTime +
                ", columnFrom=" + columnFrom +
                ", columnTo=" + columnTo +
                '}';
    }
}
