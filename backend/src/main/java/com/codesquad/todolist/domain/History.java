package com.codesquad.todolist.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Table("HISTORY")
public class History {
    private static final DateTimeFormatter FORMATTER_PATTERN = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

    @Id
    private Long id;

    private Action action;
    private String title;
    private Long fromColumnId;
    private Long toColumnId;
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

    public String getCreatedTime() {
        return createdTime.format(FORMATTER_PATTERN);
    }
}
