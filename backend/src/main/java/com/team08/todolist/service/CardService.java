package com.team08.todolist.service;

import com.team08.todolist.dto.CardDto;
import com.team08.todolist.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CardService {

    private final CardRepository cardRepository;

    @Autowired
    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    public void create(CardDto cardToCreate){
        cardRepository.save(cardToCreate.toEntity());
    }

}
