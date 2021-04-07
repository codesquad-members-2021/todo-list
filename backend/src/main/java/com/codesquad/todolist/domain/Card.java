package com.codesquad.todolist.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Card {

    @Id
    private Long id;

    private String title;
    private String content;
    private Status status;
    private LocalDateTime createdTime;
    private boolean deleted;

    private Card() { }

    public Card(String title, String content) {
        this.title = title;
        this.content = content;
        this.status = Status.TODO;
        this.createdTime = LocalDateTime.now();
        this.deleted = false;
    }

    public enum Status {
        TODO, DOING, DONE;
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", status=" + status +
                ", createdTime=" + createdTime +
                ", deleted=" + deleted +
                '}';
    }
}

