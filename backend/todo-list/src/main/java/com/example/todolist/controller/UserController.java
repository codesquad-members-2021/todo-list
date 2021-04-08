package com.example.todolist.controller;

import com.example.todolist.domain.User;
import com.example.todolist.repository.UserRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class UserController {
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public void setFixedUser(HttpSession session) {
        Long userId = 2L;
        User user = userRepository.findById(userId).orElseThrow(RuntimeException::new);
        session.setAttribute("sessionUser", user);
    }

}
