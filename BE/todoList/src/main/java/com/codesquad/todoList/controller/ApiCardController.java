package com.codesquad.todoList.controller;

import com.codesquad.todoList.entity.Card;
import com.codesquad.todoList.service.ColumnService;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/columns/{id}/cards")
@AllArgsConstructor
public class ApiCardController {

    private static final Logger log = LoggerFactory.getLogger(ApiCardController.class);

    private final ColumnService columnService;

    @PostMapping()
    public ResponseEntity<?> addCard(@Validated @RequestBody Card card, @PathVariable Long id, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            //TODO ERROR MESSAGE PUT RESPONSE BODY
            log.error("ERROR! ");
        }
        columnService.addCard(id, card);
        return ResponseEntity.ok().body(card);
    }


    @DeleteMapping("/{cardId}")
    public ResponseEntity<?> deleteCard(@PathVariable Long id, @PathVariable Long cardId) {
        boolean jobSuccessed = columnService.delete(id, cardId);
        return ResponseEntity.ok().body(jobSuccessed);
    }

    @PutMapping("/{cardId}")
    public ResponseEntity<?> updateCard(@PathVariable Long id, @PathVariable Long cardId, @Validated @RequestBody Card card, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            //TODO ERROR MESSAGE PUT RESPONSE BODY
            log.error("UPDATE CARD ERROR");
        }
        Card updateCard = columnService.updateCard(id, cardId, card);
        return ResponseEntity.ok(updateCard);
    }

}
