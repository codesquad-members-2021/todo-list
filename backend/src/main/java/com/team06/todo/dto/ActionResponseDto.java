package com.team06.todo.dto;

import com.team06.todo.domain.Action;
import com.team06.todo.domain.ActionType;
import com.team06.todo.domain.ColumnType;

import java.time.LocalDateTime;

public class ActionResponseDto {
    private String cardTitle;
    private ColumnType columnFrom;
    private ColumnType columnTo;
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

    public ColumnType getColumnFrom() {
        return columnFrom;
    }

    public ColumnType getColumnTo() {
        return columnTo;
    }

    public ActionType getActionType() {
        return actionType;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }
}
