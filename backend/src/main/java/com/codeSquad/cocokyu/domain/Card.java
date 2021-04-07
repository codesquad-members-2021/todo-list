package com.codeSquad.cocokyu.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Card {
    @Id
    private Long id;

    private String title;
    private String contents;
    private String status;
    private LocalDateTime createDateTime;

    public Card(String title, String contents, String status) {
        this.title = title;
        this.contents = contents;
        this.status = status;

        createDateTime = LocalDateTime.now();
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

    public LocalDateTime getCreateDateTime() {
        return createDateTime;
    }

}
