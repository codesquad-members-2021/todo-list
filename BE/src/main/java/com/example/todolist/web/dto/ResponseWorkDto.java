package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;

@ToString
@Getter
public class ResponseWorkDto {

    private Long id;

    private String title;

    private String content;

    private LocalDateTime createdAt;

    private int status;

    private String author;

    public ResponseWorkDto() {}

    public ResponseWorkDto(Work work, User user) {
        this.id = work.getId();
        this.title = work.getTitle();
        this.content = work.getContent();
        this.createdAt = work.getCreatedAt();
        this.status = work.getStatus();
        this.author = user.getUserId();
    }

}
