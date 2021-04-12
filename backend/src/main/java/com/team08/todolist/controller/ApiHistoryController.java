package com.team08.todolist.controller;

import com.team08.todolist.dto.HistoryDto;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/histories")
public class ApiHistoryController {

    @GetMapping
    public List<HistoryDto> list() {
        List<HistoryDto> histories = new ArrayList<>();
        histories.add(new HistoryDto( "August", LocalDateTime.now(),"title1", "add", null, "ToDo"));
        histories.add(new HistoryDto("roach", LocalDateTime.now(), "title2", "move", "ToDo", "Doing"));
        return histories;
    }
}
