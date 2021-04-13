package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.TodoLogActionCommand;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class TodoLog {
    @Id
    private Long id;
    private String action;
    private String fromColumnTitle;
    private String toColumnTitle;
    private String taskTitle;
    private LocalDateTime createdDateTime;

    public TodoLog(String action, String fromColumnTitle, String toColumnTitle, String taskTitle) {
        this.action = action;
        this.fromColumnTitle = fromColumnTitle;
        this.toColumnTitle = toColumnTitle;
        this.taskTitle = taskTitle;
        this.createdDateTime = LocalDateTime.now();
    }

    protected TodoLog() {
    }

    public static TodoLog buildCreateTodoLog(String toColumnTitle, String taskTitle) {
        return new TodoLog(TodoLogActionCommand.ADD.getActionCommand(), "", toColumnTitle, taskTitle);
    }

    public static TodoLog buildUpdateTodoLog(String toColumnTitle, String taskTitle) {
        return new TodoLog(TodoLogActionCommand.UPDATE.getActionCommand(), "", toColumnTitle, taskTitle);
    }

    public static TodoLog buildRemoveTodoLog(String toColumnTitle, String taskTitle) {
        return new TodoLog(TodoLogActionCommand.REMOVE.getActionCommand(), "", toColumnTitle, taskTitle);
    }

    public static TodoLog buildMoveTodoLog(String fromColumnTitle, String toColumnTitle, String taskTitle) {
        return new TodoLog(TodoLogActionCommand.MOVE.getActionCommand(), fromColumnTitle, toColumnTitle, taskTitle);
    }

    public Long getId() {
        return id;
    }

    public String getAction() {
        return action;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

    @Override
    public String toString() {
        return "TodoLog{" +
                "id=" + id +
                ", action='" + action + '\'' +
                ", createdDateTime=" + createdDateTime +
                '}';
    }
}
