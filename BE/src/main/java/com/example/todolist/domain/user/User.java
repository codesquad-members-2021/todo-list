package com.example.todolist.domain.user;

import lombok.*;
import org.springframework.data.annotation.Id;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User {

    @Id
    private Long id;

    private String userId;
    private String password;
    private String name;
    private String email;

}
