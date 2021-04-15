package com.example.todolist.web.dto;

import com.example.todolist.domain.work.Work;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;
import com.example.todolist.web.utils.Status;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@ToString
@Setter
public class CreateWorkRequestDTO {

    private String title;
    private String content;
    private int status;

    public Work toEntity() {
        verifyDTO();
        return Work.builder()
                .title(title)
                .content(content)
                .status(Status.makeStatusByCode(status))
                .createdAt(LocalDateTime.now())
                .build();
    }

    public void verifyDTO() {
        if (title == null || content == null || status == 0) {
            throw new EntityRelatedException(ErrorMessage.ENTITY_NOT_CREATE);
        }
    }

}
