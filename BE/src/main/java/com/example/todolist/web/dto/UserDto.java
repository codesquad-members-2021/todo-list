package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;
import com.example.todolist.web.exception.EntityNotCreateException;

public class UserDto {

    private Long id;

    private String userId;

    private String password;

    private String name;

    private String email;

    public UserDto() {}

    public UserDto(User user) {
        this.id = user.getId();
        this.userId = user.getUserId();
        this.password = user.getPassword();
        this.name = user.getName();
        this.email = user.getEmail();
    }

    public User toEntity() {
        if (userId == null || password == null || name == null || email == null) {
            throw new EntityNotCreateException();
        }
        return new User(userId, password, name, email);
    }

    public Long getId() {
        return id;
    }

    public String getUserId() {
        return userId;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

}
