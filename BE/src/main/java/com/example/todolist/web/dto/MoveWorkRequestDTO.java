package com.example.todolist.web.dto;

import com.example.todolist.domain.work.Work;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;
import com.example.todolist.web.utils.Status;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
public class MoveWorkRequestDTO {

    private int status;

    public Work toEntity() {
        verifyDTO();
        return Work.builder()
                .status(Status.makeStatusByCode(status))
                .build();
    }

    public void verifyDTO() {
        if (status != 1 && status != 2 && status !=3) {
            throw new EntityRelatedException(ErrorMessage.ENTITY_NOT_CREATE);
        }
    }

}
