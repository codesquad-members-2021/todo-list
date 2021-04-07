package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.card.Card;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

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

    @PostMapping("/todos")
    public String create(Card card){
        cardService.write(card);
        //TODO : Response 객체 생성
        return "success";
    }

}
