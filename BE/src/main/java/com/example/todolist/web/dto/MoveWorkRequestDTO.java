package com.example.todolist.web.dto;

import com.example.todolist.domain.work.Work;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
public class MoveWorkRequestDTO {

    private int status;

    public Work toEntity() {
        if (status != 1 && status != 2 && status !=3) {
            throw new EntityRelatedException(ErrorMessage.ENTITY_NOT_CREATE);
        }

        return Work.builder()
                .status(status)
                .build();
    }

}
