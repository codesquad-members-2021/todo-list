package com.team13.todolist.controller;

import com.team13.todolist.model.Card;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/api/cards")
public class CardController {

    @GetMapping
    public List<Card> card() {
        return null;
    }

}
