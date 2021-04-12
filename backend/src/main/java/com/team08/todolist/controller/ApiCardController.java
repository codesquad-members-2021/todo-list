package com.team08.todolist.controller;

import com.team08.todolist.DateTimeUtils;
import com.team08.todolist.dto.CardDto;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/cards")
public class ApiCardController {

    @PostMapping
    public CardDto create(CardDto cardToCreate) {
        return cardToCreate;
    }

    @GetMapping
    public List<CardDto> list() {
        List<CardDto> cards = new ArrayList<>();
        cards.add(new CardDto(1L, "title1",
                "content1", true, DateTimeUtils.formatByPattern(LocalDateTime.now()), 65535));
        cards.add(new CardDto(2L, "title2",
                "content2", true, DateTimeUtils.formatByPattern(LocalDateTime.now()), 65535 * 2));
        cards.add(new CardDto(3L, "title3",
                "content3", false, DateTimeUtils.formatByPattern(LocalDateTime.now()), 65535 * 4));

        return cards;
    }

    @GetMapping("/{cardId}")
    public CardDto getCard(@PathVariable Long cardId) {
        return new CardDto(cardId, "title1",
                "content1", true, DateTimeUtils.formatByPattern(LocalDateTime.now()), 65535);
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
