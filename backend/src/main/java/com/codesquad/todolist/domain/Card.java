package com.codesquad.todolist.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Card {
    @Id
    private Long id;

    private String title;
    private String content;
    private String status;
    private LocalDateTime createdTime;

    protected Card() {
    }

    public Card(String title, String content) {
        this.title = title;
        this.content = content;
        this.status = Status.TODO.name();
        this.createdTime = LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public enum Status {
        TODO, DOING, DONE
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", status=" + status +
//                ", createdTime=" + createdTime +
                '}';
    }


}

