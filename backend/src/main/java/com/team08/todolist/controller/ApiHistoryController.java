package com.team08.todolist.controller;

import com.team08.todolist.dto.HistoryDto;
import com.team08.todolist.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/histories")
public class ApiHistoryController {

    private final HistoryService historyService;

    @Autowired
    public ApiHistoryController(HistoryService historyService) {
        this.historyService = historyService;
    }

    @GetMapping
    public List<HistoryDto> list() {
        return historyService.findAll()
                .stream().map(history -> HistoryDto.of(history))
                .collect(Collectors.toList());
    }
}
