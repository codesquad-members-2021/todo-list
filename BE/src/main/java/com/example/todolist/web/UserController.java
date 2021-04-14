package com.example.todolist.web;

import com.example.todolist.domain.user.User;
import com.example.todolist.service.UserService;
import com.example.todolist.web.dto.LoginUserRequestDTO;
import com.example.todolist.web.dto.SignInUserRequestDTO;
import com.example.todolist.web.dto.UserResponseDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import static com.example.todolist.web.dto.UserResponseDTO.buildUserResponseDTO;
import static com.example.todolist.web.utils.HttpSessionUtils.USER_SESSION_KEY;


@RestController
public class UserController {

    private final Logger logger = LoggerFactory.getLogger(UserController.class);
    private final UserService userService;


    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/signIn")
    public UserResponseDTO signIn(@RequestBody SignInUserRequestDTO userDTO) {
        logger.info("회원가입 요청");
        return userService.signIn(userDTO);
    }

    @PostMapping("/login")
    public UserResponseDTO login(@RequestBody LoginUserRequestDTO userDTO, HttpSession session) {
        logger.info("로그인 요청");
        User user = userService.login(userDTO);
        session.setAttribute(USER_SESSION_KEY, user);
        return buildUserResponseDTO(user);
    }

    @GetMapping("/logout")
    public void logout(HttpSession session) {
        logger.info("로그아웃 요청");
        session.removeAttribute(USER_SESSION_KEY);
    }

}
