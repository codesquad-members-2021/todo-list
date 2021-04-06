package com.example.todolist;

import org.springframework.data.annotation.Id;

import java.time.LocalDate;

public class User {

    @Id
    Long id;

    String email;
    String name;
    LocalDate createdDate;

    public User(String email, String name) {
        this.email = email;
        this.name = name;
        this.createdDate = LocalDate.now();
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", createdDate=" + createdDate +
                '}';
    }
}
