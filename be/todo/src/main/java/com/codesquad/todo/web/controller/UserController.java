package com.codesquad.todo.web.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
public class UserController {

    @PostMapping("/login")
    public void login() {

    }

    @PostMapping("/logout")
    public void logout() {

    }
}
