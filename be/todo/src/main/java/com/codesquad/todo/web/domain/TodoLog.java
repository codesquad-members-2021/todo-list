package com.codesquad.todo.web.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("TODO_LOG")
public class TodoLog {
    @Id
    private Long id;

    private String action;
    private String fromColumnTitle;
    private String toColumnTitle;
    private String taskTitle;
    private LocalDateTime createdDateTime;

    private TodoLog(String action, String fromColumnTitle, String toColumnTitle, String taskTitle) {
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

    public void setId(Long id) {
        this.id = id;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

    public void setCreatedDateTime(LocalDateTime createdDateTime) {
        this.createdDateTime = createdDateTime;
    }

    public String getFromColumnTitle() {
        return fromColumnTitle;
    }

    public void setFromColumnTitle(String fromColumnTitle) {
        this.fromColumnTitle = fromColumnTitle;
    }

    public String getToColumnTitle() {
        return toColumnTitle;
    }

    public void setToColumnTitle(String toColumnTitle) {
        this.toColumnTitle = toColumnTitle;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public void setTaskTitle(String taskTitle) {
        this.taskTitle = taskTitle;
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
