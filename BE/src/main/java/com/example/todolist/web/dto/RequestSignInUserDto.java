package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;

public class RequestSignInUserDto {

    private String userId;

    private String password;

    private String name;

    private String email;

    public User toEntity() {
        if (userId == null || password == null || name == null || email == null) {
            throw new EntityRelatedException(ErrorMessage.ENTITY_NOT_CREATE);
        }
        return new User(userId, password, name, email);
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "RequestSignInUserDto{" +
                "userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

}
