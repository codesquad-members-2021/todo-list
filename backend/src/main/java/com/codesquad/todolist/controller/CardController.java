package com.codesquad.todolist.controller;

import com.codesquad.todolist.domain.Card;
import com.codesquad.todolist.service.CardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        return ResponseEntity.ok(responseBody("cards", cards));
    }

    @PostMapping("/{columnId}")
    public ResponseEntity create(@PathVariable Long columnId, @RequestParam(value = "title") String title,
                                 @RequestParam(value = "contents") String contents) {
        cardService.nullCheck(title, contents);
        Card card = cardService.create(columnId, title, contents);
        return ResponseEntity.ok(responseBody("card", card));
    }

    @PutMapping("/{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestParam(value = "title") String title,
                                 @RequestParam(value = "contents") String contents) {
        cardService.nullCheck(title, contents);
        Card card = cardService.update(id, title, contents);
        return ResponseEntity.ok(responseBody("card", card));
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        cardService.delete(id);
    }

    @PutMapping("/{id}/move/{columnId}/{index}")
    public ResponseEntity move(@PathVariable Long id, @PathVariable Long columnId, @PathVariable int index) {
        Card card = cardService.move(id, columnId, index);
        return ResponseEntity.ok(responseBody("card", card));
    }

    private Map<String, Object> responseBody(String rootName, Object body) {
        Map<String, Object> responseBody = new HashMap<>();
        responseBody.put(rootName, body);
        return responseBody;
    }
}
