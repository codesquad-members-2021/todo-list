package com.example.todolist.web.dto;

import com.example.todolist.domain.work.Work;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;

public class RequestUpdateWorkDto {

    private String title;

    private String description;

    public Work toEntity() {
        if (title == null || description == null) {
            throw new EntityRelatedException(ErrorMessage.ENTITY_NOT_CREATE);
        }
        return new Work(title, description);
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "RequestUpdateWorkDto{" +
                "title='" + title + '\'' +
                ", description='" + description + '\'' +
                '}';
    }

}
