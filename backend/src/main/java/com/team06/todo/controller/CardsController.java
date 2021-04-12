package com.team06.todo.controller;

import com.team06.todo.domain.Card;
import com.team06.todo.dto.CardResponseDto;
import com.team06.todo.dto.CardsResponse;
import com.team06.todo.service.CardsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RequestMapping("/api/cards")
@RestController
public class CardsController {

    private final CardsService cardsService;

    Logger logger = LoggerFactory.getLogger(CardsController.class);

    public CardsController(CardsService cardsService) {
        this.cardsService = cardsService;
    }

    @GetMapping("/show")
    public ResponseEntity<CardsResponse> show() {
        return ResponseEntity.ok(cardsService.show());
    }

    @PostMapping("/create")
    public ResponseEntity<CardResponseDto> create(@RequestBody HashMap<String, String> cardInfo) {
        return ResponseEntity.ok(cardsService.save(cardInfo));
    }

    @PutMapping("/{id}/move")
    public ResponseEntity<CardResponseDto> move(@PathVariable Long id, @RequestBody HashMap<String, String> cardInfo) {
        return ResponseEntity.ok(cardsService.move(id, cardInfo));
    }

    @PutMapping("/{id}/update")
    public ResponseEntity<CardResponseDto> update(@PathVariable Long id, @RequestBody HashMap<String, String> cardInfo) {
        return ResponseEntity.ok(cardsService.update(id, cardInfo));
    }

    @DeleteMapping("/{id}/delete")
    public ResponseEntity<CardResponseDto> delete(@PathVariable Long id) {
        return ResponseEntity.ok(cardsService.delete(id));
    }
}
