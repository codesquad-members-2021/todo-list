package com.team08.todolist.controller;

import com.team08.todolist.dto.CardDto;
import com.team08.todolist.model.Card;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/cards")
public class ApiCardController {

    @PostMapping
    public void create() {

    }

    @GetMapping
    public List<CardDto> list() {
        List<CardDto> cards = new ArrayList<>();
        cards.add(new CardDto(1L, "title1",
                "content1", true, LocalDateTime.now(), 65535));
        cards.add(new CardDto(2L, "title2",
                "content2", true, LocalDateTime.now(), 65535 * 2));
        cards.add(new CardDto(3L, "title3",
                "content3", false, LocalDateTime.now(), 65535 * 4));

        return cards;
    }

    @GetMapping("/{cardId}")
    public CardDto getCard(@PathVariable Long cardId) {
        return new CardDto(cardId, "title1",
                "content1", true, LocalDateTime.now(), 65535);
    }

    // TODO : to return API result
    @PutMapping("/{cardId}")
    public void update(@PathVariable Long cardId, Card cardToUpdate) {

    }

    // TODO : to return API result
    @DeleteMapping("/{cardId}")
    public void delete(@PathVariable Long cardId) {

    }
}
