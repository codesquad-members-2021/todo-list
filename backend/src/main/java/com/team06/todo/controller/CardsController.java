package com.team06.todo.controller;

import com.team06.todo.dto.*;
import com.team06.todo.service.CardsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<CardResponseDto> create(@RequestBody CardCreateRequestDto cardCreateRequestDto) {
        CardResponseDto cardResponseDto= cardsService.save(cardCreateRequestDto);
        return ResponseEntity.ok(cardResponseDto);
    }

    @PutMapping("/{id}/move")
    public ResponseEntity<CardResponseDto> move(@PathVariable Long id, @RequestBody CardMoveRequestDto cardMoveRequestDto) {
        return ResponseEntity.ok(cardsService.move(id, cardMoveRequestDto));
    }

    @PutMapping("/{id}/update")
    public ResponseEntity<CardResponseDto> update(@PathVariable Long id, @RequestBody CardUpdateRequestDto cardUpdateRequestDto) {
        return ResponseEntity.ok(cardsService.update(id, cardUpdateRequestDto));
    }

    @DeleteMapping("/{id}/delete")
    public ResponseEntity<CardResponseDto> delete(@PathVariable Long id) {
        return ResponseEntity.ok(cardsService.delete(id));
    }
}
