package com.team08.todolist.controller;

import com.team08.todolist.model.Card;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/items")
public class ApiCardController {

    @PostMapping
    public void create() {

    }

    @GetMapping
    public List<Card> list() {
        List<Card> cards = new ArrayList<>();
        cards.add(new Card(1, "woody", "title1",
                "content1", LocalDateTime.now(), true,
                1, 0));
        cards.add(new Card(2, "woody", "title2",
                "content2", LocalDateTime.now(), false,
                2, 0));
        cards.add(new Card(3, "woody", "title3",
                "content3", LocalDateTime.now(), false,
                2, 2));
        return cards;
    }

    @GetMapping("/{cardId}")
    public Card getCard(@PathVariable int cardId) {
        return new Card(cardId, "woody", "title1",
                "content1", LocalDateTime.now(), true,
                1, 0);
    }
}
