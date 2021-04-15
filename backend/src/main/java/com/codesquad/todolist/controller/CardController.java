package com.codesquad.todolist.controller;

import com.codesquad.todolist.domain.Card;
import com.codesquad.todolist.service.CardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/card")
public class CardController {

    private final CardService cardService;

    public CardController(CardService cardService) {
        this.cardService = cardService;
    }

    @GetMapping("/{columnId}")
    public ResponseEntity view(@PathVariable Long columnId) {
        List<Card> cards = cardService.viewCardByColumnId(columnId);
        return new ResponseEntity(cards, HttpStatus.OK);
    }


    @PostMapping("/{columnId}")
    public ResponseEntity create(@PathVariable Long columnId, @RequestParam(value = "title") String title,
                                 @RequestParam(value = "contents") String contents) {
        cardService.nullCheck(title, contents);
        Card card = cardService.create(columnId, title, contents);
        return new ResponseEntity(card, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestParam(value = "title") String title,
                                 @RequestParam(value = "contents") String contents) {
        cardService.nullCheck(title, contents);
        Card card = cardService.update(id, title, contents);
        return new ResponseEntity(card, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable Long id) {
        cardService.delete(id);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PutMapping("/{id}/move/{columnId}/{index}")
    public ResponseEntity move(@PathVariable Long id, @PathVariable Long columnId, @PathVariable int index) {
        Card card = cardService.move(id, columnId, index);
        return new ResponseEntity(card, HttpStatus.OK);
    }
}
