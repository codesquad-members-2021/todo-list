package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.card.Card;
import com.codeSquad.cocokyu.domain.card.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CardController {

    private CardService cardService;

    public CardController(CardService cardService) {
        this.cardService = cardService;
    }

    @GetMapping("/todos")
    public CardList hello() {
        return cardService.sortedList();
    }

}
