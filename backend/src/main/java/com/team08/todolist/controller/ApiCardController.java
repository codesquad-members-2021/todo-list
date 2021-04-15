package com.team08.todolist.controller;

import com.team08.todolist.dto.CardDto;
import com.team08.todolist.service.CardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/cards")
public class ApiCardController {

    private static final Logger logger = LoggerFactory.getLogger(ApiCardController.class);

    private final CardService cardService;

    @Autowired
    public ApiCardController(CardService cardService) {
        this.cardService = cardService;
    }

    @GetMapping
    public List<CardDto> list() {
        return cardService.findAll()
                .stream().map(card -> CardDto.of(card))
                .collect(Collectors.toList());
    }

    @PostMapping
    public CardDto create(CardDto cardToCreate) {
        cardService.create(cardToCreate.toEntity());
        return cardToCreate;
    }

    @PutMapping("/{cardId}")
    public CardDto update(@PathVariable Long cardId, CardDto cardToUpdate) {
        return cardToUpdate;
    }

    @DeleteMapping("/{cardId}")
    public String delete(@PathVariable Long cardId) {
        cardService.delete(cardId);
        return cardId + " card is deleted";
    }
}
