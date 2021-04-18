package com.team08.todolist.controller;

import com.team08.todolist.dto.CardDto;
import com.team08.todolist.model.Card;
import com.team08.todolist.service.CardService;
import com.team08.todolist.service.HistoryService;
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
    private final HistoryService historyService;

    @Autowired
    public ApiCardController(CardService cardService, HistoryService historyService) {
        this.cardService = cardService;
        this.historyService = historyService;
    }

    @GetMapping
    public ApiResponse list() {
        List<CardDto> cards = cardService.findAll()
                .stream()
                .map(card -> CardDto.of(card))
                .collect(Collectors.toList());
        return ApiResponse.OK(cards);
    }

    @PostMapping
    public ApiResponse create(@RequestBody CardDto cardToCreate) {
        cardService.create(cardToCreate.toEntity());
        historyService.generateAdd(cardToCreate);
        return ApiResponse.OK(cardToCreate);
    }

    @PutMapping("/{cardId}")
    public ApiResponse update(@PathVariable Long cardId, @RequestBody CardDto cardToUpdate) {
        Long columnId = cardService.update(cardId, cardToUpdate);
        logger.debug("Card to update has column id {}.", columnId);
        logger.debug("Updated card info has column id {}.", columnId);
        generateUpdatedCardHistory(columnId, cardToUpdate);
        return ApiResponse.OK(cardToUpdate);
    }

    private void generateUpdatedCardHistory(Long columnId, CardDto cardToUpdate) {
        if (columnId == cardToUpdate.getColumnId()) {
            historyService.generateUpdate(cardToUpdate);
            return;
        }
        historyService.generateMove(columnId, cardToUpdate);
    }

    @DeleteMapping("/{cardId}")
    public ApiResponse delete(@PathVariable Long cardId) {
        CardDto cardDto = cardService.delete(cardId);
        historyService.generateRemove(cardDto);
        return ApiResponse.OK(cardId, cardId + " card is deleted");
    }
}
