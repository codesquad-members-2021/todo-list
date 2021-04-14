package com.team08.todolist.controller;

import com.team08.todolist.DateTimeUtils;
import com.team08.todolist.dto.CardDto;
import com.team08.todolist.service.ColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/columns")
public class ApiColumnController {

    private final ColumnService columnService;

    @Autowired
    public ApiColumnController(ColumnService columnService) {
        this.columnService = columnService;
    }

    @GetMapping("/{columnId}")
    public List<CardDto> column(@PathVariable Long columnId) {
        List<CardDto> cards = new ArrayList<>();
        cards.add(new CardDto(1L, "title1",
                "content1", true, DateTimeUtils.formatByPattern(LocalDateTime.now()), 65535));
        cards.add(new CardDto(2L, "title2",
                "content2", true, DateTimeUtils.formatByPattern(LocalDateTime.now()), 65535 * 2));
        cards.add(new CardDto(3L, "title3",
                "content3", false, DateTimeUtils.formatByPattern(LocalDateTime.now()), 65535 * 4));
        return cards;
    }
}
