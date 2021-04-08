package codesquad.TodoList.service;

import codesquad.TodoList.domain.Card;
import codesquad.TodoList.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardService {

    private CardRepository cardRepository;

    @Autowired
    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    public void createTodo(Card card) {
        card.changeStateTodo();
        cardRepository.save(card);
    }

    public void createDoing(Card card) {
        card.changeStateDoing();
        cardRepository.save(card);
    }

    public void createDone(Card card) {
        card.changeStateDone();
        cardRepository.save(card);
    }

    public List<Card> read() {
        return cardRepository.findAllByTodoTrueOrDoingTrueOrDoneTrue();
    }

    public void edit(Long id, Card newCard) {
        Card card = getCardById(id);
        card.update(newCard);
        cardRepository.save(card);
    }

    public void delete(Long id) {
        getCardById(id).delete();
    }

    public Card getCardById(Long id) {
        return cardRepository.findById(id).orElseThrow(NullPointerException::new);
    }

    public void changeStateTodo(Long id) {
        createTodo(getCardById(id));
    }

    public void changeStateDoing(Long id) {
        createDoing(getCardById(id));
    }

    public void changeStateDone(Long id) {
        createDone(getCardById(id));
    }
}
