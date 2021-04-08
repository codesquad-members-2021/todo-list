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
    public void newCard(Card card) {
        // 우선은 Todo에서만 새 Card 생성 가능
        card.changeStateTodo();
        cardRepository.save(card);
    }

    // READ
    @GetMapping
    @ResponseBody
    public List<Card> showCards() {
        return cardRepository.findAllByTodoTrueOrDoingTrueOrDoneTrue();
    }

    // MOVE
    @PutMapping("/{id}/todo")
    public void moveCardsTodo(@PathVariable Long id) {
        Card card = cardRepository.findById(id).orElseThrow();
        card.changeStateTodo();
        cardRepository.save(card);
    }

    @PutMapping("/{id}/doing")
    public void moveCardsDoing(@PathVariable Long id) {
        Card card = cardRepository.findById(id).orElseThrow();
        card.changeStateDoing();
        cardRepository.save(card);
    }

    @PutMapping("/{id}/done")
    public void moveCardsDone(@PathVariable Long id) {
        Card card = cardRepository.findById(id).orElseThrow();
        card.changeStateTodo();
        cardRepository.save(card);
    }

    // UPDATE
    @PutMapping("/{id}")
    public void editCards(@PathVariable Long id, Card newCard) {
        Card card = cardRepository.findById(id).orElseThrow();
        card.update(newCard);
        cardRepository.save(card);
    }

    // DELETE
    @DeleteMapping("/{id}")
    public void deleteCards(@PathVariable Long id) {
        Card card = cardRepository.findById(id).orElseThrow();
        cardRepository.delete(card);
    }
}
