package com.codesquad.todo.web.domain;

public class User {
    private Long id;
    private String name;
    private String userId;
    private String password;
    private String profileImage;

    public User(Long id, String name, String userId, String password, String profileImage) {
        this.id = id;
        this.name = name;
        this.userId = userId;
        this.password = password;
        this.profileImage = profileImage;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getUserId() {
        return userId;
    }

    public String getPassword() {
        return password;
    }

    public String getProfileImage() {
        return profileImage;
    }
}
