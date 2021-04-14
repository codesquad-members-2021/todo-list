package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.exceptions.ColumnNotFoundException;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.util.ArrayList;
import java.util.List;

@Table("TODO_USER")
public class TodoUser {
    @Id
    private Long id;
    private String name;
    private String userId;
    private String password;
    private String profileImage;
    private List<TodoColumn> todoColumnList = new ArrayList<>();
    private List<TodoLog> todoLogList = new ArrayList<>();

    protected TodoUser() {
    }

    public TodoUser(String name, String userId, String password, String profileImage) {
        this.name = name;
        this.userId = userId;
        this.password = password;
        this.profileImage = profileImage;
    }

    public void addColumn(String columnTitle) {
        addColumn(new TodoColumn(columnTitle));

    }

    public void addColumn(TodoColumn todoColumn) {
        todoColumnList.add(todoColumn);

    }

    public TodoColumn findColumnById(Long id) {
        return todoColumnList.stream()
                .filter(column -> column.isSameId(id)).findFirst()
                .orElseThrow(ColumnNotFoundException::new);
    }

    public void moveTask(Long prevColumnId, Long nextColumnId, Long taskId, int newTaskPosition) {
        TodoColumn prevTodoColumn = findColumnById(prevColumnId);
        TodoTask todoTask = prevTodoColumn.popTask(taskId);
        TodoColumn nextTodoColumn = findColumnById(nextColumnId);
        nextTodoColumn.addTaskAt(newTaskPosition, todoTask);

        TodoLog todoLog = TodoLog.buildMoveTodoLog(prevTodoColumn.getColumnTitle(), nextTodoColumn.getColumnTitle(), todoTask.getTaskTitle());
        addTodoLog(todoLog);
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

    public List<TodoColumn> getColumnList() {
        return todoColumnList;
    }

    public void setColumnList(List<TodoColumn> todoColumnList) {
        this.todoColumnList = todoColumnList;
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
                ", columnList=" + todoColumnList +
                ", todoLogList=" + todoLogList +
                '}';
    }

    public void addTodoLog(TodoLog todoLog) {
        todoLogList.add(todoLog);
    }
}
