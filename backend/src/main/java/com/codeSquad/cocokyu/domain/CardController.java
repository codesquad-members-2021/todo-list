package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.dto.CardDto;
import com.codeSquad.cocokyu.domain.dto.CardList;
import com.codeSquad.cocokyu.domain.dto.LogList;
import com.codeSquad.cocokyu.domain.model.Card;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
public class CardController {

    private CardService cardService;

    public CardController(CardService cardService) {
        this.cardService = cardService;
    }

    @GetMapping("/todos")
    public CardList sortedList() {
        return cardService.sortedList();
    }

    @GetMapping("/logs")
    public LogList logList() {
        return cardService.logList();
    }

    @PostMapping("/todos")
    public ResponseEntity<Message> create(@RequestBody @Valid CardDto cardDto) {
        Card card = new Card(cardDto);
        cardService.write(card);
        return new ResponseEntity<>(Message.of(), HttpStatus.CREATED);
    }

    @PutMapping("/todos/{id}")
    public HttpEntity<Message> update(@PathVariable Long id, @RequestBody @Valid CardDto cardDto) {
        cardService.modify(id, cardDto);
        return new ResponseEntity<>(Message.of(), HttpStatus.OK);
    }

    @DeleteMapping("/todos/{id}")
    public HttpEntity<Message> delete(@PathVariable Long id) {
        cardService.delete(id);
        return new ResponseEntity<>(Message.of(), HttpStatus.OK);
    }

}
