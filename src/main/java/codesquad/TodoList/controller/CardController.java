package codesquad.TodoList.controller;

import codesquad.TodoList.domain.Card;
import codesquad.TodoList.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cards")
public class CardController {

    private CardRepository cardRepository;

    @Autowired
    public CardController(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    // CREATE
    @PostMapping
    public void newCard(@RequestParam("card") Card card) {
        cardRepository.save(card);
    }
    // READ
    @GetMapping
    @ResponseBody
    public List<Card> showCards() {
         return cardRepository.findAllByTodoTrueOrDoingTrueOrDoneTrue();
    }
    // MOVE
    @PutMapping("/{id}/status")
    public void moveCards() {

    }

    // UPDATE
    @PutMapping("/{id}")
    public void editCards() {

    }
    // DELETE
    @DeleteMapping
    public void deleteCards() {

    }
}
