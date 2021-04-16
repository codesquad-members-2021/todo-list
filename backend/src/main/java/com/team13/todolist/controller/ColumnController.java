package com.team13.todolist.controller;

import com.team13.todolist.model.AddCardParameter;
import com.team13.todolist.model.Card;
import com.team13.todolist.model.CardInfo;
import com.team13.todolist.model.UpdateCardParameter;
import com.team13.todolist.service.ColumnService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/columns")
public class ColumnController {

    private final ColumnService columnService;
    private final Logger log = LoggerFactory.getLogger(ColumnController.class);

    public ColumnController(ColumnService columnService) {
        this.columnService = columnService;
    }

    @GetMapping
    public ResponseEntity<?> columns() {
        return ResponseEntity.ok(responseBody("columns", columnService.getColumns()));
    }

    @GetMapping("/{columnId}")
    public ResponseEntity<?> column(@PathVariable("columnId") Long columnId) {
        return ResponseEntity.ok(responseBody("column", columnService.getColumn(columnId)));
    }

    @PostMapping("/{columnId}/cards")
    public ResponseEntity<?> addCard(@PathVariable("columnId") Long columnId, @RequestBody AddCardParameter card) {
        log.debug("Add Card : {}", card.getTitle());
        return ResponseEntity.ok(responseBody("card", columnService.addCard(columnId, Card.of(card.getTitle(), card.getBody()))));
    }

    @DeleteMapping("/{columnId}/cards/{cardId}")
    public ResponseEntity<?> removeCard(
            @PathVariable("columnId") Long columnId,
            @PathVariable("cardId") Long cardId
    ) {
        columnService.removeCard(columnId, cardId);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/{columnId}/cards/{cardId}")
    public ResponseEntity<?> updateCard(
            @PathVariable("columnId") Long columnId,
            @PathVariable("cardId") Long cardId,
            @RequestBody UpdateCardParameter updateCardInfo
            ) {
        return ResponseEntity.ok(responseBody("card", columnService.updateCard(columnId, cardId, updateCardInfo)));
    }

    private Map<String, Object> responseBody(String rootName, Object body) {
        Map<String, Object> responseBody = new HashMap<>();
        responseBody.put(rootName, body);
        return responseBody;
    }

}
