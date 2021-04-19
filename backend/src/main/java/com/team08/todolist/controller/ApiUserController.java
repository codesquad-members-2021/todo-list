package com.team08.todolist.controller;

import com.team08.todolist.model.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class ApiUserController {

    @GetMapping
    public User response() {
        return new User("woody", "1234", "jihye");
    }
}
