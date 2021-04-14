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

    private ActionResponseDto() {
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


    public static class Builder {
        private String cardTitle;
        private int columnFrom;
        private int columnTo;
        private ActionType actionType;
        private LocalDateTime createdDateTime;

        public Builder() {
        }

        private Builder cardTitle(String cardTitle) {
            this.cardTitle = cardTitle;
            return this;
        }

        private Builder columnFrom(int columnFrom) {
            this.columnFrom = columnFrom;
            return this;
        }

        private Builder columnTo(int columnTo) {
            this.columnTo = columnTo;
            return this;
        }

        private Builder actionType(ActionType actionType) {
            this.actionType = actionType;
            return this;
        }

        private Builder createdDateTime(LocalDateTime createdDateTime) {
            this.createdDateTime = createdDateTime;
            return this;
        }

        public ActionResponseDto build() {
            ActionResponseDto actionResponseDto = new ActionResponseDto();
            actionResponseDto.cardTitle = cardTitle;
            actionResponseDto.columnFrom = columnFrom;
            actionResponseDto.columnTo = columnTo;
            actionResponseDto.actionType = actionType;
            actionResponseDto.createdDateTime = createdDateTime;
            return actionResponseDto;
        }
    }

    public static ActionResponseDto from(Action action) {
        return new Builder()
                .cardTitle(action.getCardTitle())
                .columnFrom(action.getColumnFrom())
                .columnTo(action.getColumnTo())
                .actionType(action.getActionType())
                .createdDateTime(action.getCreatedDateTime())
                .build();
    }
}
