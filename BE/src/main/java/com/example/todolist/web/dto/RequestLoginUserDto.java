package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;

public class RequestLoginUserDto {

    private String userId;

    private String password;

    public User toEntity() {
        if (userId == null || password == null) {
            throw new EntityRelatedException(ErrorMessage.ENTITY_NOT_CREATE);
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
