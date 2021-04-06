package com.team13.todolist.model;

import org.springframework.data.annotation.Id;

public class User {
    @Id
    private Long id;

    private String userId;
    private String password;
    private String name;
}
