package com.team13.todolist.model;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("card")
@JsonTypeInfo(include = JsonTypeInfo.As.WRAPPER_OBJECT, use = JsonTypeInfo.Id.NAME)
public class UpdateCardParameter {

    private Long columnId;
    private Long cardId;
    private Long previousCardId;
    private String title;
    private String body;

    public UpdateCardParameter() {
    }

    public UpdateCardParameter(Long columnId, Long cardId, Long previousCardId, String title, String body) {
        this.columnId = columnId;
        this.cardId = cardId;
        this.previousCardId = previousCardId;
        this.title = title;
        this.body = body;
    }

    public Long getColumnId() {
        return columnId;
    }

    public Long getCardId() {
        return cardId;
    }

    public Long getPreviousCardId() {
        return previousCardId;
    }

    public String getTitle() {
        return title;
    }

    public String getBody() {
        return body;
    }
}
