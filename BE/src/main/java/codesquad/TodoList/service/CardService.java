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

    public void create(Card card) {
        cardRepository.save(card);
    }

    public List<Card> read() {
        return (List<Card>) cardRepository.findAll();
    }

    public void edit(Long id, Card newCard) {
        Card card = getCardById(id);
        card.update(newCard);
        cardRepository.save(card);
    }

    public void delete(Long id) {
        Card card = getCardById(id);
        card.setStatus(Card.Status.DELETED);
        cardRepository.save(card);
    }

    public Card getCardById(Long id) {
        return cardRepository.findById(id).orElseThrow(NullPointerException::new);
    }
}
