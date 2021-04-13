package com.example.todolist.web.dto;

import com.example.todolist.domain.timeline.Timeline;
import com.example.todolist.domain.user.User;

import java.time.LocalDateTime;

public class ResponseTimelineDto {

    private Long id;

    private String description;

    private LocalDateTime createdTime;

    private String author;

    public ResponseTimelineDto() {}

    public ResponseTimelineDto(Timeline timeline, User user) {
        this.id = timeline.getId();
        this.description = timeline.getDescription();
        this.createdTime = timeline.getCreatedTime();
        this.author = user.getUserId();
    }

    public Long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public LocalDateTime getCreatedTime() {
        return createdTime;
    }

    public String getAuthor() {
        return author;
    }

    @Override
    public String toString() {
        return "ResponseTimelineDto{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", createdTime=" + createdTime +
                ", author='" + author + '\'' +
                '}';
    }

}
