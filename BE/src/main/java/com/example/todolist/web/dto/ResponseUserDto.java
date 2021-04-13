package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;
import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
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

}
