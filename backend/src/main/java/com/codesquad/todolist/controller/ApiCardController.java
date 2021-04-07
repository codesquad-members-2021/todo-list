package com.codesquad.todolist.controller;

import com.codesquad.todolist.domain.Card;
import com.codesquad.todolist.repository.CardRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiCardController {

    private Logger logger = LoggerFactory.getLogger(ApiCardController.class);

    private CardRepository cardRepository;

    @Autowired
    public ApiCardController(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    @GetMapping("/api/card/{cardId}")
    public Card card(@PathVariable("cardId") Long id){
        return cardRepository.save();
    }

}
