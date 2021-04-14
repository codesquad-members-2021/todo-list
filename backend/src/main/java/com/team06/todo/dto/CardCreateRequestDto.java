package com.team06.todo.dto;

public class CardCreateRequestDto {
    private String title;
    private String contents;
    private int columnType;

    public CardCreateRequestDto() {
    }

    public String getTitle() {
        return this.title;
    }

    public String getContents() {
        return this.contents;
    }

    public int getColumnType() {
         return this.columnType;
    }
}
