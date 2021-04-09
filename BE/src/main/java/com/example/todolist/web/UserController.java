package com.example.todolist.web;

import com.example.todolist.domain.user.User;
import com.example.todolist.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import static com.example.todolist.web.utils.HttpSessionUtils.USER_SESSION_KEY;


@RestController
public class UserController {

    private final Logger logger = LoggerFactory.getLogger(UserController.class);
    private final UserService userService;


    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public User login(@RequestBody User user, HttpSession session) {
        session.setAttribute(USER_SESSION_KEY, userService.login(user.getUserId(), user.getPassword()));
        return user;
    }

    @GetMapping("/logout")
    public void logout(HttpSession session) {
        session.removeAttribute("sessionUser");
    }

}
