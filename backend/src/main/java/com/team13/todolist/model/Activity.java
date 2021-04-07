package com.team13.todolist.model;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Activity {
    @Id
    private Long id;

    private Long actionUserId;
    private String action;
    private String title;
    private String fromColumn;
    private String toColumn;
    private LocalDateTime actionTime;

    public Activity(Long id, Long actionUserId, String action, String title, String fromColumn, String toColumn, LocalDateTime actionTime) {
        this.id = id;
        this.actionUserId = actionUserId;
        this.action = action;
        this.title = title;
        this.fromColumn = fromColumn;
        this.toColumn = toColumn;
        this.actionTime = actionTime;
    }

    public Long getId() {
        return id;
    }

    public Long getActionUserId() {
        return actionUserId;
    }

    public String getAction() {
        return action;
    }

    public String getTitle() {
        return title;
    }

    public String getFromColumn() {
        return fromColumn;
    }

    public String getToColumn() {
        return toColumn;
    }

    public LocalDateTime getActionTime() {
        return actionTime;
    }
}
