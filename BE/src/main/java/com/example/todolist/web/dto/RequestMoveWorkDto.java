package com.example.todolist.web.dto;

import com.example.todolist.domain.work.Work;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;

public class RequestMoveWorkDto {

    private int status;

    public Work toEntity() {
        if (status != 1 && status != 2 && status !=3) {
            throw new EntityRelatedException(ErrorMessage.ENTITY_NOT_CREATE);
        }
        return new Work(status);
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "RequestMoveWorkDto{" +
                "status=" + status +
                '}';
    }

}
