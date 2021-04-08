package com.codesquad.todolist.service;

import com.codesquad.todolist.domain.Card;
import com.codesquad.todolist.domain.Status;
import com.codesquad.todolist.repository.CardRepository;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class CardService {

    private final CardRepository cardRepository;

    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    public Card create(Long columnId, String title, String contents, String status) {

        Card card = new Card(title, contents, status, columnId);
        cardRepository.save(card);
        return card;
    }
}
