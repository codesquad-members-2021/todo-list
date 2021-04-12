package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.exceptions.ColumnNotFoundException;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

public class User {
    @Id
    private Long id;
    private String name;
    private String userId;
    private String password;
    private String profileImage;
    private List<Column> columnList = new ArrayList<>();
    private List<TodoLog> todoLogList = new ArrayList<>();


    protected User() {
    }

    public User(String name, String userId, String password, String profileImage) {
        this.name = name;
        this.userId = userId;
        this.password = password;
        this.profileImage = profileImage;
    }

    public void addColumn(String columnTitle) {
        addColumn(new Column(columnTitle));

    }

    public void addColumn(Column column) {
        columnList.add(column);

    }

    public Column findColumnById(Long id) {
        return columnList.stream()
                .filter(column -> column.isSameId(id)).findFirst()
                .orElseThrow(ColumnNotFoundException::new);
    }

    public void moveTask(Long prevColumnId, Long nextColumnId, Long taskId, int newTaskPosition) {
        Column prevColumn = findColumnById(prevColumnId);
        Task task = prevColumn.popTask(taskId);
        Column nextColumn = findColumnById(nextColumnId);
        nextColumn.addTaskAt(newTaskPosition, task);
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

    public List<TodoLog> getTodoLogList() {
        return todoLogList;
    }

    public void setTodoLogList(List<TodoLog> todoLogList) {
        this.todoLogList = todoLogList;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                ", profileImage='" + profileImage + '\'' +
                ", columnList=" + columnList +
                ", todoLogList=" + todoLogList +
                '}';
    }
}
