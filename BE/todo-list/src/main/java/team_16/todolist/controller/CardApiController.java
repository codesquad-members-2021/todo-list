package team_16.todolist.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team_16.todolist.domain.Card;
import team_16.todolist.repository.CardRepository;

@RestController
public class CardApiController {

    CardRepository cardRepository;

    public CardApiController(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    @GetMapping("")
    public void test(Card card){
        cardRepository.save(card);
    }
}

