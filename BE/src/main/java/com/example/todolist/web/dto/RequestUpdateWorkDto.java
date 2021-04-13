package com.example.todolist.web.dto;

import com.example.todolist.domain.work.Work;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
public class RequestUpdateWorkDto {

    private String title;

    private String content;

    public Work toEntity() {
        if (title == null || content == null) {
            throw new EntityRelatedException(ErrorMessage.ENTITY_NOT_CREATE);
        }

        return Work.builder()
                .title(title)
                .content(content)
                .build();
    }

}
