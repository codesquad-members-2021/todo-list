package com.team06.todo.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Action {
    @Id
    Long id;

    ActionType actionType;
    Card card;
    LocalDateTime created_date_time;

    enum ActionType {
        ADD,
        REMOVE,
        UPDATE,
        MOVE
    }
}
