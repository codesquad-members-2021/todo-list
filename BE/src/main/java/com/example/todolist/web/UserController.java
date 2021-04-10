package com.example.todolist.web;

import com.example.todolist.domain.user.User;
import com.example.todolist.service.UserService;
import com.example.todolist.web.dto.RequestLoginUserDto;
import com.example.todolist.web.dto.RequestSignInUserDto;
import com.example.todolist.web.dto.ResponseLoginUserDto;
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

    @PostMapping("/signIn")
    public void signIn(@RequestBody RequestSignInUserDto requestUserDto) {
        logger.info("회원가입 요청");
        userService.signIn(requestUserDto);
    }

    @PostMapping("/login")
    public ResponseLoginUserDto login(@RequestBody RequestLoginUserDto requestUserDto, HttpSession session) {
        logger.info("로그인 요청");
        User user = userService.login(requestUserDto);
        session.setAttribute(USER_SESSION_KEY, user);
        return new ResponseLoginUserDto(user);
    }

    @GetMapping("/logout")
    public void logout(HttpSession session) {
        logger.info("로그아웃 요청");
        session.removeAttribute(USER_SESSION_KEY);
    }

}
