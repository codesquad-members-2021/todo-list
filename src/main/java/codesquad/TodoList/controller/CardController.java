package codesquad.TodoList.controller;

import codesquad.TodoList.domain.Card;
import codesquad.TodoList.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cards")
public class CardController {

    private CardService cardService;

    @Autowired
    public CardController(CardService cardService) {
        this.cardService = cardService;
    }

    // CREATE
    @PostMapping
    public void newCard(Card card) {
        cardService.createTodo(card);
    }

    // READ
    @GetMapping
    @ResponseBody
    public List<Card> showCards() {
        return cardService.read();
    }

    // MOVE
    @PutMapping("/{id}/todo")
    public void moveCardsTodo(@PathVariable Long id) {
        cardService.changeStateTodo(id);
    }

    @PutMapping("/{id}/doing")
    public void moveCardsDoing(@PathVariable Long id) {
        cardService.changeStateDoing(id);
    }

    @PutMapping("/{id}/done")
    public void moveCardsDone(@PathVariable Long id) {
        cardService.changeStateDone(id);
    }

    // UPDATE
    @PutMapping("/{id}")
    public void editCards(@PathVariable Long id, Card newCard) {
        cardService.edit(id, newCard);
    }

    // DELETE
    @DeleteMapping("/{id}")
    public void deleteCards(@PathVariable Long id) {
        cardService.delete(id);
    }
}
