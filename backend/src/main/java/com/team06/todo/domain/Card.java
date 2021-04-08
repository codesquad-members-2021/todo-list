package com.team06.todo.domain;

import org.springframework.data.annotation.Id;

import java.util.HashMap;

public class Card {
    @Id
    Long id;

    String title;
    String contents;
    int column_id;
    String media;

    protected Card() {
    }

    public Card(HashMap<String, String> cardInfo) {
        this.title = cardInfo.get("title");
        this.contents = cardInfo.get("contents");
        this.column_id = Integer.parseInt(cardInfo.get("column_id"));
        this.media = cardInfo.get("media");
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

    public int getColumn_id() {
        return column_id;
    }

    public String getMedia() {
        return media;
    }
}
