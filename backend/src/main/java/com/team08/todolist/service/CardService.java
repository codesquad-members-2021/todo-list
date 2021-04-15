package com.team08.todolist.service;

import com.team08.todolist.dto.CardDto;
import com.team08.todolist.model.Card;
import com.team08.todolist.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardService {

    private final CardRepository cardRepository;

    @Autowired
    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    public void create(Card cardToCreate) {
        cardRepository.save(cardToCreate);
    }

    public List<Card> findAll() {
        return cardRepository.findAll();
    }

    public void delete(Long cardId) {
        cardRepository.deleteById(cardId);
    }

    public void update(Long cardId, CardDto cardToUpdate) {
        Card card = cardRepository.findById(cardId)
                .orElseThrow(IllegalArgumentException::new);
        card.update(cardToUpdate);
        cardRepository.save(card);
    }
}
