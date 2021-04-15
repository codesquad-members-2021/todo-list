package com.codesquad.todolist.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Table("HISTORY")
public class History {

    @Id
    private Long id;

    private Action action;
    private String title;
    private Long fromColumnId;
    private Long toColumnId;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
    private LocalDateTime createdTime;

    public History() {}

    public static History createHistory(Action action, String title, Long fromColumnId, Long toColumnId) {
        History history = new History();
        history.action = action;
        history.title = title;
        history.fromColumnId = fromColumnId;
        history.toColumnId = toColumnId;
        history.createdTime = LocalDateTime.now();
        return history;
    }

    public Long getId() {
        return id;
    }

    public Action getAction() {
        return action;
    }

    public String getTitle() {
        return title;
    }

    public Long getFromColumnId() {
        return fromColumnId;
    }

    public Long getToColumnId() {
        return toColumnId;
    }

    public LocalDateTime getCreatedTime() {
        return createdTime;
    }
}
