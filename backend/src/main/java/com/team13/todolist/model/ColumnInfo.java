package com.team13.todolist.model;

import java.util.List;

public class ColumnInfo {

    private Long columnId;
    private String name;
    private List<CardInfo> cards;

    public ColumnInfo(Long columnId, String name, List<CardInfo> cards) {
        this.columnId = columnId;
        this.name = name;
        this.cards = cards;
    }

    public Long getColumnId() {
        return columnId;
    }

    public String getName() {
        return name;
    }

    public List<CardInfo> getCards() {
        return cards;
    }
}
