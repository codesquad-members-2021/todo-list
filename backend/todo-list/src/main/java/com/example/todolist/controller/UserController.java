package com.example.todolist.controller;

import com.example.todolist.JwtUtil;
import com.example.todolist.domain.User;
import com.example.todolist.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@RestController
@RequestMapping("/users")
public class UserController {
    private final UserRepository userRepository;
    private final JwtUtil jwtUtil;

    @Autowired
    public UserController(UserRepository userRepository, JwtUtil jwtUtil) {
        this.userRepository = userRepository;
        this.jwtUtil = jwtUtil;
    }

    @PostMapping
    public ResponseEntity<User> create(@RequestBody HashMap<String, String> newUserInfo) {
        User newUser = new User(newUserInfo.get("name"), newUserInfo.get("password"), jwtUtil.createToken());
        userRepository.save(newUser);
        return new ResponseEntity(newUser, HttpStatus.OK);
    }

    @PostMapping("/login")
    public ResponseEntity login(@RequestBody HashMap<String, String> userInfo, HttpServletResponse response) {
        Long userId = Long.valueOf(userInfo.get("userId"));

        User user = userRepository.findById(userId).orElseThrow(RuntimeException::new);
        if (!user.getPassword().equals(userInfo.get("password"))) {
            throw new RuntimeException();
        }

        String jwtToken = user.getToken();
        Cookie cookie = new Cookie("jwtToken", jwtToken);
        cookie.setPath("/");
        response.addCookie(cookie);
        return new ResponseEntity(jwtToken, HttpStatus.OK);
    }
}
