package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;

public class ResponseUserDto {

    private Long id;

    private String userId;

    private String name;

    private String email;

    public ResponseUserDto() {}

    public ResponseUserDto(User user) {
        this.id = user.getId();
        this.userId = user.getUserId();
        this.name = user.getName();
        this.email = user.getEmail();
    }

    public Long getId() {
        return id;
    }

    public String getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "ResponseUserDto{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

}
