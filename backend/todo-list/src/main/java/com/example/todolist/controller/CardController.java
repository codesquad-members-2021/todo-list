package com.example.todolist.controller;


import com.example.todolist.CustomResolver;
import com.example.todolist.domain.*;
import com.example.todolist.service.CardService;
import com.example.todolist.service.HistoryService;
import com.example.todolist.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
@RequestMapping("/cards")
public class CardController {

    public final CardService cardService;
    public final UserService userService;
    public final HistoryService historyService;

    @Autowired
    public CardController(CardService cardService, UserService userService, HistoryService historyService) {
        this.cardService = cardService;
        this.userService = userService;
        this.historyService = historyService;
    }

    @PostMapping
    public ResponseEntity<Card> create(@RequestBody HashMap<String, String> cardInfo, @CustomResolver String userName) {
        User user = userService.findUserByName(userName);
        Card card = new Card(user, cardInfo.get("title"), cardInfo.get("contents"), cardInfo.get("status"));
        cardService.save(card);
        History log = new History(card, "add");
        historyService.save(log);
        return new ResponseEntity<>(card, HttpStatus.OK);
    }

    @PutMapping("/{id}/edit")
    public ResponseEntity<Card> update(@PathVariable Long id, @RequestBody HashMap<String, String> newCardInfo, @CustomResolver String userName) {
        Card card = cardService.findCardById(id);
        User user = userService.findUserByName(userName);
        if (!card.getUserId().equals(user.getUserId())) {
            throw new RuntimeException("수정 권한이 없습니다.");
        }
        card.update(newCardInfo.get("title"), newCardInfo.get("contents"));
        cardService.save(card);
        History log = new History(card, "update");
        historyService.save(log);
        return new ResponseEntity<>(card, HttpStatus.OK);
    }

    @PutMapping("/{id}/status")
    public ResponseEntity<Card> move(@PathVariable Long id, @RequestBody HashMap<String, String> newCardInfo, @CustomResolver String userName) {
        Card card = cardService.findCardById(id);
        User user = userService.findUserByName(userName);
        if (!card.getUserId().equals(user.getUserId())) {
            throw new RuntimeException("수정 권한이 없습니다.");
        }
        String preStatus = card.getStatus();
        card.update(newCardInfo.get("status"));
        cardService.save(card);
        History log = new History(card, "move", preStatus);
        historyService.save(log);
        return new ResponseEntity<>(card, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Card> delete(@PathVariable Long id, @CustomResolver String userName) {
        Card card = cardService.findCardById(id);
        User user = userService.findUserByName(userName);
        if (!card.getUserId().equals(user.getUserId())) {
            throw new RuntimeException("삭제 권한이 없습니다.");
        }
        History log = new History(card, "remove");
        card.delete();
        historyService.save(log);
        cardService.save(card);
        return new ResponseEntity<>(card, HttpStatus.OK);
    }
}

