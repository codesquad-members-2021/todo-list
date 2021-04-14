package com.example.todolist.domain.timeline;

import lombok.*;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Timeline {

    @Id
    private Long id;

    private String content;
    private LocalDateTime createdAt;
    private Long authorId;

}
