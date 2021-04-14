package com.example.todolist.service;

import com.example.todolist.domain.Card;
import com.example.todolist.domain.User;
import com.example.todolist.dto.CardDTO;
import com.example.todolist.repository.CardRepository;
import com.example.todolist.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CardService {
    private final CardRepository cardRepository;
    private final UserRepository userRepository;

    public CardService(CardRepository cardRepository, UserRepository userRepository) {
        this.cardRepository = cardRepository;
        this.userRepository = userRepository;
    }

    public void save(Card card) {
        cardRepository.save(card);
    }

    public Card findCardById(Long id) {
        return cardRepository.findById(id).orElseThrow(RuntimeException::new);
    }

    public List<CardDTO> cardDtoTodoList() {
        List<Card> cards = cardRepository.findAllByStatus("todo");
        return cardDtoList(cards);
    }

    public List<CardDTO> cardDtoDoingList() {
        List<Card> cards = cardRepository.findAllByStatus("doing");
        return cardDtoList(cards);
    }

    public List<CardDTO> cardDtoDoneList() {
        List<Card> cards = cardRepository.findAllByStatus("done");
        return cardDtoList(cards);
    }

    private List<CardDTO> cardDtoList(List<Card> cards) {
        List<CardDTO> result = new ArrayList<>();
        for (Card card : cards) {
            User user = userRepository.findById(card.getUserId()).orElseThrow(RuntimeException::new);
            CardDTO cardDto = new CardDTO(user, card.getTitle(), card.getContents(), card.getPostTime());
            result.add(cardDto);
        }
        return result;
    }
}
