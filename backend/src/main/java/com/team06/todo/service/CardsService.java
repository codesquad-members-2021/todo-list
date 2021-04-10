package com.team06.todo.service;

import com.team06.todo.domain.Card;
import com.team06.todo.domain.ColumnType;
import com.team06.todo.repository.CardsRepository;
import org.springframework.stereotype.Service;


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

    public Card save(HashMap<String, String> cardInfo) {
        Card card = new Card(cardInfo);
        cardsRepository.save(card);
        actionsService.save(card);
        return card;
    }

    public List<Card> show() {
        return (List<Card>) cardsRepository.findAll();
    }

    public Card findById(Long id) {
        return cardsRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("해당 카드를 찾을 수 없습니다. id = " + id));
    }

    public Card move(Long id, HashMap<String, String> cardInfo) {
        Card card = cardsRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("해당 카드를 찾을 수 없습니다. id = " + id));
        ColumnType columnFrom = card.getColumnType();
        card.move(cardInfo);
        cardsRepository.save(card);
        actionsService.move(card, columnFrom, ColumnType.valueOf(cardInfo.get("column_type")));
        return card;
    }

    public Card update(Long id, HashMap<String, String> cardInfo) {
        Card card = cardsRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("해당 카드를 찾을 수 없습니다. id = " + id));
        card.update(cardInfo);
        cardsRepository.save(card);
        actionsService.update(card);
        return card;
    }

    public Card delete(Long id) {
        Card card = cardsRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("해당 카드를 찾을 수 없습니다. id = " + id));
        actionsService.delete(card);
        cardsRepository.deleteById(id);
        return card;
    }
}
