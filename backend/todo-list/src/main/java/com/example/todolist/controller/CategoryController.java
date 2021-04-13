package com.example.todolist.controller;

import com.example.todolist.ApiResponse;
import com.example.todolist.domain.User;
import com.example.todolist.dto.CardDto;
import com.example.todolist.dto.CategoryDto;
import com.example.todolist.dto.HistoryDto;
import com.example.todolist.repository.UserRepository;
import com.example.todolist.service.CardService;
import com.example.todolist.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class CategoryController {

    public final CardService cardService;
    public final HistoryService historyService;
    public final UserRepository userRepository;

    @Autowired
    public CategoryController(CardService cardService, UserRepository userRepository, HistoryService historyService) {
        this.cardService = cardService;
        this.userRepository = userRepository;
        this.historyService = historyService;
    }

    public User getUserFromToken(HttpServletRequest request) {
        return (User) request.getAttribute("user");
    }

    @GetMapping
    public ResponseEntity<ApiResponse> home() {
        List<CardDto> todo = cardService.cardDtoTodoList();
        List<CardDto> doing = cardService.cardDtoDoingList();
        List<CardDto> done = cardService.cardDtoDoneList();
        CategoryDto columns = new CategoryDto(todo, doing, done);
        List<HistoryDto> historyDtoList = historyService.historyList();
        ApiResponse apiResponse = new ApiResponse(columns, historyDtoList);
        return new ResponseEntity<>(apiResponse, HttpStatus.OK);
    }

}
