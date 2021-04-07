package com.team13.todolist.service;

import com.team13.todolist.model.Card;
import com.team13.todolist.repository.CardRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardService {

    private final CardRepository cardRepository;

    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    public List<Card> cards() {
        return cardRepository.findAll();
    }
}
