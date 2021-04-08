package com.team06.todo.domain;

import org.springframework.data.annotation.Id;

public class Card {
    @Id
    Long id;

    String title;
    String content;
    int column_id;
    String media;
}
