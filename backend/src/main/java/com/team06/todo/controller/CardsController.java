package com.team06.todo.controller;

import com.team06.todo.domain.Card;
import com.team06.todo.service.CardsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/api/cards")
@RestController
public class CardsController {

    private final CardsService cardsService;

    Logger logger = LoggerFactory.getLogger(CardsController.class);

    public CardsController(CardsService cardsService) {
        this.cardsService = cardsService;
    }

    @GetMapping("/show")
    public ResponseEntity<Map<String, List<Card>>> show() {
        Map<String, List<Card>> cardsResponse = new HashMap<>();
        cardsResponse.put("cards", cardsService.show());
        logger.info(cardsResponse.toString());
        return ResponseEntity.ok(cardsResponse);
    }

    @PostMapping("/create")
    public ResponseEntity<Card> create(@RequestBody HashMap<String, String> cardInfo) {
        Card card = new Card(cardInfo);
        cardsService.save(card);
        return ResponseEntity.ok(card);
    }
     // 수정 : 데이터 전체
    @PutMapping("/{id}/move")
    public ResponseEntity<Card> move(@PathVariable Long id, @RequestBody HashMap<String, String> cardInfo) {
        Card card = cardsService.findById(id);
        cardsService.move(card, cardInfo);
        return ResponseEntity.ok(card);
    }

    @PutMapping("/{id}/update")
    public ResponseEntity<Card> update(@PathVariable Long id, @RequestBody HashMap<String, String> cardInfo) {
        Card card = cardsService.findById(id);
        cardsService.update(card, cardInfo);
        return ResponseEntity.ok(card);
    }

    @DeleteMapping("/{id}/delete")
    public ResponseEntity<Card> delete(@PathVariable Long id) {
        Card card = cardsService.findById(id);
        cardsService.delete(id);
        ResponseEntity.ok();
        return ResponseEntity.ok(card);
    }
}
