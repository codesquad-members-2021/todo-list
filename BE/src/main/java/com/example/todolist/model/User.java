package com.example.todolist.model;

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

    public Long getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
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
