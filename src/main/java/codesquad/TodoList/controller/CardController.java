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
    public String newCard(Card card) {
        // 우선은 Todo에서만 새 Card 생성 가능
        card.changeStateTodo();
        cardRepository.save(card);
        return "redirect:/cards";
    }

    // READ
    @GetMapping
    @ResponseBody
    public List<Card> showCards() {
        return cardRepository.findAllByTodoTrueOrDoingTrueOrDoneTrue();
    }

    // MOVE
    @GetMapping("/{id}/todo")
    public String moveCardsTodo(@PathVariable Long id) {
        Card card = cardRepository.findById(id).orElseThrow();
        card.changeStateTodo();
        cardRepository.save(card);
        return "redirect:/cards";
    }

    @GetMapping("/{id}/doing")
    public String moveCardsDoing(@PathVariable Long id) {
        Card card = cardRepository.findById(id).orElseThrow();
        card.changeStateDoing();
        cardRepository.save(card);
        return "redirect:/cards";
    }

    @GetMapping("/{id}/done")
    public String moveCardsDone(@PathVariable Long id) {
        Card card = cardRepository.findById(id).orElseThrow();
        card.changeStateTodo();
        cardRepository.save(card);
        return "redirect:/cards";
    }

    // UPDATE
    @PutMapping("/{id}")
    public void editCards(Card card, Card newCard) {
        card.update(newCard);
        cardRepository.save(card);
    }

    // DELETE
    @DeleteMapping("/{id}")
    public void deleteCards(Card card) {
        cardRepository.delete(card);
    }
}
