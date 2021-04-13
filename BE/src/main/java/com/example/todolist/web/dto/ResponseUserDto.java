package com.example.todolist.web.dto;

import com.example.todolist.domain.user.User;
import lombok.*;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ResponseUserDto {

    private Long id;

    private String userId;

    private String name;

    private String email;

    public static ResponseUserDto buildResponseUserDto(User user) {
        return ResponseUserDto.builder()
                .id(user.getId())
                .userId(user.getUserId())
                .name(user.getName())
                .email(user.getEmail())
                .build();
    }

}
