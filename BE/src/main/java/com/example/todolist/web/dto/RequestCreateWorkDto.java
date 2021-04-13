package com.example.todolist.web.dto;

import com.example.todolist.domain.work.Work;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;

public class RequestCreateWorkDto {

    private String title;

    private String description;

    private int status;

    public Work toEntity() {
        if (title == null || description == null || status == 0) {
            throw new EntityRelatedException(ErrorMessage.ENTITY_NOT_CREATE);
        }
        return new Work(title, description, status);
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "RequestCreateWorkDto{" +
                "title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                '}';
    }

}
