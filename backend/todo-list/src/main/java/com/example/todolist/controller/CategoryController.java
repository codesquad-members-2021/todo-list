package com.example.todolist.controller;

import com.example.todolist.ApiResponse;
import com.example.todolist.JwtUtil;
import com.example.todolist.domain.User;
import com.example.todolist.dto.*;
import com.example.todolist.repository.UserRepository;
import com.example.todolist.service.CardService;
import com.example.todolist.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

@RestController
public class CategoryController {

    public final CardService cardService;
    public final HistoryService historyService;
    public final UserRepository userRepository;
    private final JwtUtil jwtUtil;

    @Autowired
    public CategoryController(CardService cardService, HistoryService historyService, UserRepository userRepository, JwtUtil jwtUtil) {
        this.cardService = cardService;
        this.historyService = historyService;
        this.userRepository = userRepository;
        this.jwtUtil = jwtUtil;
    }

    private String login(HttpServletResponse response) {
        Long userId = Long.valueOf(1L);

        User user = userRepository.findById(userId).orElseThrow(RuntimeException::new);
        if (!user.getPassword().equals("test")) {
            throw new RuntimeException();
        }

        String jwtToken = jwtUtil.createToken(user.getName());
        Cookie cookie = new Cookie("jwtToken", jwtToken);
        cookie.setPath("/");
        response.addCookie(cookie);
        return jwtToken;
    }

    @GetMapping
    public ResponseEntity<ApiResponse> home(HttpServletResponse response) {
        String jwtToken = login(response);
        List<CardDto> todo = cardService.cardDtoTodoList();
        List<CardDto> doing = cardService.cardDtoDoingList();
        List<CardDto> done = cardService.cardDtoDoneList();
        CategoryDto columns = new CategoryDto(todo, doing, done);
        List<HistoryDto> historyDtoList = historyService.historyList();
        ApiResponse apiResponse = new ApiResponse(columns, historyDtoList, jwtToken);
        return new ResponseEntity<>(apiResponse, HttpStatus.OK);
    }
}
