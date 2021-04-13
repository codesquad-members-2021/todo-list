package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;
import lombok.Setter;
import lombok.ToString;

@ToString(exclude = "password")
@Setter
public class RequestLoginUserDto {

    private String userId;

    private String password;

    public User toEntity() {
        if (userId == null || password == null) {
            throw new EntityRelatedException(ErrorMessage.ENTITY_NOT_CREATE);
        }

        return User.builder()
                .userId(userId)
                .password(password)
                .build();
    }

}
