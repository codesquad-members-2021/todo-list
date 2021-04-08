package com.example.todolist.controller;

import com.example.todolist.JwtUtil;
import com.example.todolist.domain.User;
import com.example.todolist.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@RestController
public class UserController {
    private final UserRepository userRepository;
    private final JwtUtil jwtUtil;

    @Autowired
    public UserController(UserRepository userRepository, JwtUtil jwtUtil) {
        this.userRepository = userRepository;
        this.jwtUtil = jwtUtil;
    }

    @GetMapping
    public void setFixedUser(HttpSession session) {
        Long userId = 2L;
        User user = userRepository.findById(userId).orElseThrow(RuntimeException::new);
        session.setAttribute("sessionUser", user);
    }

    @GetMapping("/token")
    public ResponseEntity<User> create(@RequestBody HashMap<String, String> newUserInfo) {
        User newUser = new User(newUserInfo.get("name"), newUserInfo.get("password"), jwtUtil.createToken());
        userRepository.save(newUser);
        return new ResponseEntity(newUser, HttpStatus.OK);
    }
}
