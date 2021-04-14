package com.team08.todolist.controller;

import com.team08.todolist.DateTimeUtils;
import com.team08.todolist.dto.CardDto;
import com.team08.todolist.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/cards")
public class ApiCardController {

    private final CardService cardService;

    @Autowired
    public ApiCardController(CardService cardService) {
        this.cardService = cardService;
    }

    @GetMapping
    public List<CardDto> list() {
        List<CardDto> cards = new ArrayList<>();
        cards.add(new CardDto(1L, "title1",
                "content1", true, DateTimeUtils.formatByPattern(LocalDateTime.now().minusDays(1)), 65535, 1L));
        cards.add(new CardDto(2L, "title2",
                "content2", true, DateTimeUtils.formatByPattern(LocalDateTime.now().minusHours(3)), 65535 * 2, 1L));
        cards.add(new CardDto(3L, "title3",
                "content3", false, DateTimeUtils.formatByPattern(LocalDateTime.now().minusHours(1)), 65535, 2L));
        cards.add(new CardDto(4L, "title4",
                "content4", false, DateTimeUtils.formatByPattern(LocalDateTime.now()), 65535, 3L));
        return cards;
    }

    @PostMapping
    public CardDto create(CardDto cardToCreate) {
        return cardToCreate;
    }

    @PutMapping("/{cardId}")
    public CardDto update(@PathVariable Long cardId, CardDto cardToUpdate) {
        return cardToUpdate;
    }

    @DeleteMapping("/{cardId}")
    public String delete(@PathVariable Long cardId) {
        return cardId + " card is deleted";
    }
}
