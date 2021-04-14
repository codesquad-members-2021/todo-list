package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import lombok.*;

import java.time.LocalDateTime;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WorkResponseDTO {

    private Long id;
    private String title;
    private String content;
    private LocalDateTime createdAt;
    private int status;
    private String author;

    public static WorkResponseDTO buildResponseWorkDto(Work work, User user) {
        return WorkResponseDTO.builder()
                .id(work.getId())
                .title(work.getTitle())
                .content(work.getContent())
                .createdAt(work.getCreatedAt())
                .status(work.getStatus())
                .author(user.getUserId())
                .build();
    }

}
