package com.example.todolist.web.dto;

import com.example.todolist.domain.timeline.Timeline;
import com.example.todolist.domain.user.User;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;

@ToString
@Getter
public class ResponseTimelineDto {

    private Long id;

    private String content;

    private LocalDateTime createdAt;

    private String author;

    public ResponseTimelineDto() {}

    public ResponseTimelineDto(Timeline timeline, User user) {
        this.id = timeline.getId();
        this.content = timeline.getContent();
        this.createdAt = timeline.getCreatedAt();
        this.author = user.getUserId();
    }

}
