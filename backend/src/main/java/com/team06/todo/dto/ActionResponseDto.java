package com.team06.todo.dto;

import com.team06.todo.domain.Action;
import com.team06.todo.domain.ActionType;

import java.time.LocalDateTime;

public class ActionResponseDto {
    private String cardTitle;
    private int columnFrom;
    private int columnTo;
    private ActionType actionType;
    private LocalDateTime createdDateTime;

    public ActionResponseDto() {
    }

    public ActionResponseDto(Action action) {
        this.cardTitle = action.getCardTitle();
        this.columnFrom = action.getColumnFrom();
        this.columnTo = action.getColumnTo();
        this.actionType = action.getActionType();
        this.createdDateTime = action.getCreatedDateTime();
    }

    public String getCardTitle() {
        return cardTitle;
    }

    public int getColumnFrom() {
        return columnFrom;
    }

    public int getColumnTo() {
        return columnTo;
    }

    public ActionType getActionType() {
        return actionType;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }
}
