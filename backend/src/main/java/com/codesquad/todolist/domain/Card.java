package com.codesquad.todolist.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Card {

    @Id
    private Long id;

    private String title;
    private String contents;
    private Long columnId;
    private LocalDateTime createdTime;

    public Card(String title, String contents, Long columnId) {
        this.title = title;
        this.contents = contents;
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

    public Long getColumnId() {
        return columnId;
    }

    public LocalDateTime getCreatedTime() {
        return createdTime;
    }

    public void update(String title, String contents) {
        this.title = title;
        this.contents = contents;
    }

    public void move(Long toColumnId) {
        this.columnId = toColumnId;
    }
}
