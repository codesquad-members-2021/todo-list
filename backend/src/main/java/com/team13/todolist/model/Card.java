package com.team13.todolist.model;

import org.springframework.data.annotation.Id;

public class Card {
    @Id
    private Long id;

    private String title;
    private String body;

    private Long columnId;
    private Long authorId;
}
