package com.team13.todolist.controller;

import com.team13.todolist.model.Card;
import com.team13.todolist.service.CardService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/cards")
public class CardController {

    private final CardService cardService;

    public CardController(CardService cardService) {
        this.cardService = cardService;
    }

    @GetMapping
    public ResponseEntity<Map<String, List<Card>>> cards() {
        Map<String, List<Card>> cardsResponse = new HashMap<>();
        cardsResponse.put("cards", cardService.cards());
        return ResponseEntity.ok(cardsResponse);
    }

}
