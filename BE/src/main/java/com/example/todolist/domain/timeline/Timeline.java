package com.example.todolist.domain.timeline;

import lombok.Getter;
import lombok.ToString;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

@ToString
@Getter
public class Timeline {

    @Id
    private Long id;

    private String content;

    private LocalDateTime createdAt;

    private Long authorId;

    public Timeline() {}

    public Timeline(String content, Long authorId) {
        this.content = content;
        this.createdAt = LocalDateTime.now();
        this.authorId = authorId;
    }

}
