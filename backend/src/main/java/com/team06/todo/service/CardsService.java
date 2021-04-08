package com.team06.todo.service;

import com.team06.todo.domain.Card;
import com.team06.todo.repository.CardRepository;
import org.springframework.stereotype.Service;

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
}
