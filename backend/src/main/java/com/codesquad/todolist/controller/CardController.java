package com.codesquad.todolist.controller;

import com.codesquad.todolist.domain.Card;
import com.codesquad.todolist.service.CardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/card")
public class CardController {

    private final CardService cardService;

    public CardController(CardService cardService) {
        this.cardService = cardService;
    }

    @PostMapping("/{columnId}")
    public ResponseEntity create(@PathVariable Long columnId, @RequestParam(value = "title") String title,
                                 @RequestParam(value = "contents") String contents,
                                 @RequestParam(value = "status") String status) {

        Card card = cardService.create(columnId, title, contents, status);
        return new ResponseEntity(card, HttpStatus.OK);
    }
}
