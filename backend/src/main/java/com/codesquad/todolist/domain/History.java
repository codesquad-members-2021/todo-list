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

    private String action;
    private String title;
    private Long fromColumnId;
    private Long toColumnId;
    private LocalDateTime createdTime;

    public History(String action, String title, Long fromColumnId, Long toColumnId) {
        this.action = action;
        this.title = title;
        this.fromColumnId = fromColumnId;
        this.toColumnId = toColumnId;
        this.createdTime = LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public String getAction() {
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
