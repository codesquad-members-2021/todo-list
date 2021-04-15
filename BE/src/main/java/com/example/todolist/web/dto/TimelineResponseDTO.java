package com.example.todolist.web.dto;

import com.example.todolist.domain.timeline.Timeline;
import com.example.todolist.domain.user.User;
import lombok.*;

import java.time.LocalDateTime;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TimelineResponseDTO {

    private Long id;
    private String content;
    private LocalDateTime createdAt;
    private String author;

    public static TimelineResponseDTO buildTimelineResponseDTO(Timeline timeline, User user) {
        return TimelineResponseDTO.builder()
                .id(timeline.getId())
                .content(timeline.getContent())
                .createdAt(timeline.getCreatedAt())
                .author(user.getUserId())
                .build();
    }

}
