package com.example.todolist.web;

import com.example.todolist.domain.user.UserRepository;
import com.example.todolist.domain.user.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@RestController
public class UserController {

    private final Logger logger = LoggerFactory.getLogger(UserController.class);
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping("/login")
    public User login(@RequestBody User user, HttpSession session) {
        logger.info(user.toString());
        User loginUser = userRepository.findById(1L).get();
        session.setAttribute("sessionUser", loginUser);
        return loginUser;
    }

    @GetMapping("/logout")
    public void logout(HttpSession session) {
        session.removeAttribute("sessionUser");
    }

}
