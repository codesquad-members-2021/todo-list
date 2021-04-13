package com.example.todolist.domain.user;

import lombok.*;
import org.springframework.data.annotation.Id;

@ToString
@Getter
@NoArgsConstructor
public class User {

    @Id
    private Long id;

    private String userId;

    private String password;

    private String name;

    private String email;

    public User(String userId, String password) {
        this.userId = userId;
        this.password = password;
    }

    public User(String userId, String password, String name, String email) {
        this.userId = userId;
        this.password = password;
        this.name = name;
        this.email = email;
    }

}
