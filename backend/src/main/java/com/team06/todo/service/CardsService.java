package com.team06.todo.service;

import com.team06.todo.domain.Card;
import com.team06.todo.domain.ColumnType;
import com.team06.todo.dto.*;
import com.team06.todo.repository.CardsRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class CardsService {

    private final CardsRepository cardsRepository;
    private final ActionsService actionsService;

    public CardsService(CardsRepository cardsRepository, ActionsService actionsService) {
        this.cardsRepository = cardsRepository;
        this.actionsService = actionsService;
    }

    public CardResponseDto save(CardCreateRequestDto cardCreateRequestDto) {
        Card card = new Card(cardCreateRequestDto);
        cardsRepository.save(card);
        actionsService.save(card);
        return new CardResponseDto(card);
    }

    public CardsResponse show() {
        List<Card> cards = (List<Card>) cardsRepository.findAll();
        List<CardResponseDto> cardResponseDtos = new ArrayList<>();
        for (Card card : cards) {
            cardResponseDtos.add(new CardResponseDto(card));
        }
        return new CardsResponse(cardResponseDtos);
    }

    public Card findById(Long id) {
        return cardsRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("해당 카드를 찾을 수 없습니다. id = " + id));
    }

    public CardResponseDto move(Long id, CardMoveRequestDto cardMoveRequestDto) {
        Card card = cardsRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("해당 카드를 찾을 수 없습니다. id = " + id));
        int columnFrom = card.getColumnType();
        card.move(cardMoveRequestDto);
        cardsRepository.save(card);
        actionsService.move(card, columnFrom, card.getColumnType());
        return new CardResponseDto(card);
    }

    public CardResponseDto update(Long id, CardUpdateRequestDto cardUpdateRequestDto) {
        Card card = cardsRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("해당 카드를 찾을 수 없습니다. id = " + id));
        card.update(cardUpdateRequestDto);
        cardsRepository.save(card);
        actionsService.update(card);
        return new CardResponseDto(card);
    }

    public CardResponseDto delete(Long id) {
        Card card = cardsRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("해당 카드를 찾을 수 없습니다. id = " + id));
        actionsService.delete(card);
        cardsRepository.deleteById(id);
        return new CardResponseDto(card);
    }
}
