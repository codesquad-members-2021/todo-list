package com.team08.todolist.controller;

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
    public List<Card> list() {
        List<Card> cards = new ArrayList<>();
        cards.add(new Card(1L, "woody", "title1",
                "content1", LocalDateTime.now(), true,
                1L, 0));
        cards.add(new Card(2L, "woody", "title2",
                "content2", LocalDateTime.now(), false,
                2L, 0));
        cards.add(new Card(3L, "woody", "title3",
                "content3", LocalDateTime.now(), false,
                2L, 2));
        return cards;
    }

    @GetMapping("/{cardId}")
    public Card getCard(@PathVariable Long cardId) {
        return new Card(cardId, "woody", "title1",
                "content1", LocalDateTime.now(), true,
                1L, 0);
    }

    @PutMapping("/{cardId}")
    public void update(@PathVariable Long cardId, Card cardToUpdate) {

    }

    @DeleteMapping("/{cardId}")
    public void delete(@PathVariable Long cardId) {

    }
}
