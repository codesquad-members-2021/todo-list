package com.codesquad.todolist.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Card {

    @Id
    private Long id;

    private String title;
    private String contents;
    private String status;
    private Long columnId;
    private LocalDateTime createdTime;

    public Card(String title, String contents, String status, Long columnId) {
        this.title = title;
        this.contents = contents;
        this.status = status;
        this.columnId = columnId;
        this.createdTime = LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }

    public String getStatus() {
        return status;
    }

    public Long getColumnId() {
        return columnId;
    }

    public LocalDateTime getCreatedTime() {
        return createdTime;
    }
}
