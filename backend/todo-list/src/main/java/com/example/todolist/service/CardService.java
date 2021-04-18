package com.example.todolist.service;

import com.example.todolist.domain.Card;
import com.example.todolist.domain.User;
import com.example.todolist.dto.CardDTO;
import com.example.todolist.exception.CardNotFoundException;
import com.example.todolist.exception.IllegalUserAccessException;
import com.example.todolist.repository.CardRepository;
import com.example.todolist.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class CardService {
    private final CardRepository cardRepository;
    private final UserService userService;

    @Autowired
    public CardService(CardRepository cardRepository, UserService userService) {
        this.cardRepository = cardRepository;
        this.userService = userService;
    }

    public void save(Card card) {
        cardRepository.save(card);
    }

    public Card findCardById(Long id) {
        return cardRepository.findById(id).orElseThrow(CardNotFoundException::new);
    }

    public Card findVerifiedCardById(Long id, String userName) {
        Card card = findCardById(id);
        checkPermission(card, userName);
        return card;
    }

    private void checkPermission(Card card, String userName) {
        User user = userService.findUserByName(userName);
        if (!card.isValidUser(user)) {
            throw new IllegalUserAccessException();
        }
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
            Object[] cardInfo = card.cardInfo();
            User user = userService.findUserById((Long) cardInfo[1]);
            CardDTO cardDto = new CardDTO((Long) cardInfo[0], user, (String) cardInfo[2], (String) cardInfo[3], (LocalDateTime) cardInfo[4]);
            result.add(cardDto);
        }
        return result;
    }
}
