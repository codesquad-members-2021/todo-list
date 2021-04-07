package com.example.todolist;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CardController {

    public final CardRepository cardRepository;

    public CardController(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    @GetMapping("/test")
    public Card card() {
        Card card = new Card("robin", "todo-content-jane", "doing");
        cardRepository.save(card);
        Card card1 = cardRepository.findById(1L).get();
        return card1;
    }
}
