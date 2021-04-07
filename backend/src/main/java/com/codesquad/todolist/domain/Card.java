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


    public enum Status {
        TODO, DOING, DONE;
    }
}

