package com.codesquad.todo.web.domain;

import java.util.ArrayList;
import java.util.List;

public class User {
    private Long id;
    private String name;
    private String userId;
    private String password;
    private String profileImage;
    private List<Column> columnList;
    private List<Column> todoLogList;

    public User(Long id, String name, String userId, String password, String profileImage,
                List<Column> columnList, List<Column> todoLogList) {
        this.id = id;
        this.name = name;
        this.userId = userId;
        this.password = password;
        this.profileImage = profileImage;
        this.columnList = columnList;
        this.todoLogList = todoLogList;
    }

    public User(Long id, String name, String userId, String password, String profileImage) {
        this(id, name, userId, password, profileImage, new ArrayList<>(), new ArrayList<>());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }

    public List<Column> getColumnList() {
        return columnList;
    }

    public void setColumnList(List<Column> columnList) {
        this.columnList = columnList;
    }

    public List<Column> getTodoLogList() {
        return todoLogList;
    }

    public void setTodoLogList(List<Column> todoLogList) {
        this.todoLogList = todoLogList;
    }
}
