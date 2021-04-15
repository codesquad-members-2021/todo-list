package com.example.todolist.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;

public class User {

    @JsonIgnore
    @Id
    private Long userId;

    private String name;

    @JsonIgnore
    private String password;

    private String profileUrl;

    protected User() {
    }

    public User(String name, String password, String profileUrl) {
        this.name = name;
        this.password = password;
        this.profileUrl = profileUrl;
    }

    public Long getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getProfileUrl() {
        return profileUrl;
    }
}
