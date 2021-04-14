package com.codesquad.todolist.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("CARD")
public class Card {

    @Id
    private Long id;

    private String title;
    private String contents;
    private Long columnId;
    private LocalDateTime createdTime;
    private Double flag;

    public Card(String title, String contents, Long columnId, Double flag) {
        this.title = title;
        this.contents = contents;
        this.columnId = columnId;
        this.flag = flag;
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

    public Double getFlag() {
        return flag;
    }

    public void update(String title, String contents) {
        this.title = title;
        this.contents = contents;
    }

    public void move(Long toColumnId, Double flag) {
        this.columnId = toColumnId;
        this.flag = flag;
    }
}
