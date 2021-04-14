package com.team08.todolist.controller;

import com.team08.todolist.dto.HistoryDto;
import com.team08.todolist.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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

        LocalDateTime timeOffset = LocalDateTime.now();
        List<HistoryDto> histories = new ArrayList<>();
        histories.add(new HistoryDto("August", timeOffset.plusMinutes(3L), "title1", "add", null, "ToDo"));
        histories.add(new HistoryDto("roach", timeOffset.plusMinutes(5L), "title2", "move", "ToDo", "Doing"));
        histories.add(new HistoryDto("Woody", timeOffset.plusHours(4L), "title3", "update", "ToDo", null));
        histories.add(new HistoryDto("Downey", timeOffset.plusDays(5L).plusSeconds(40), "title4", "remove", "Done", null));
        histories.add(new HistoryDto("Downey", timeOffset.plusDays(1L).plusHours(5L), "title5", "add", "ToDo", null));
        histories.add(new HistoryDto("ZG", timeOffset.plusWeeks(1L), "title6", "move", "Doing", "Done"));
        histories.add(new HistoryDto("ZG", timeOffset.plusWeeks(1L).plusDays(3L), "title7", "move", "ToDo", "Doing"));
        return histories;
    }
}
