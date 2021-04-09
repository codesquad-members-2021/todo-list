package com.team06.todo.service;

import com.team06.todo.domain.Card;
import com.team06.todo.repository.CardRepository;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CardsService {

    private final CardRepository cardRepository;

    public CardsService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    public void save(Card card) {
        cardRepository.save(card);
    }

    public List<Card> show() {
        return (List<Card>) cardRepository.findAll();
    }

    public Card findById(Long id) {
        return cardRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("해당 카드를 찾을 수 없습니다. id = " + id));
    }

    public void move(Card card, HashMap<String, String> cardInfo) {
        card.move(cardInfo);
        cardRepository.save(card);
    }

    public void update(Card card, HashMap<String, String> cardInfo) {
        card.update(cardInfo);
        cardRepository.save(card);
    }

    public void delete(Long id) {
        cardRepository.deleteById(id);
    }
}
