package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;
import com.example.todolist.exception.EntityNotCreateException;

public class RequestLoginUserDto {

    private String userId;

    private String password;

    public User toEntity() {
        if (userId == null || password == null) {
            throw new EntityNotCreateException();
        }
        return new User(userId, password);
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "RequestLoginUserDto{" +
                "userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

}
