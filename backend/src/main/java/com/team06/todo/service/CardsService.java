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

    public void save(Card card) {
        cardsRepository.save(card);
        actionsService.save(card);
    }

    public List<Card> show() {
        return (List<Card>) cardsRepository.findAll();
    }

    public Card findById(Long id) {
        return cardsRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("해당 카드를 찾을 수 없습니다. id = " + id));
    }

    public void move(Card card, HashMap<String, String> cardInfo) {
        ColumnType columnFrom = card.getColumnType();
        card.move(cardInfo);
        cardsRepository.save(card);
        actionsService.move(card, columnFrom, ColumnType.valueOf(cardInfo.get("column_type")));
    }

    public void update(Card card, HashMap<String, String> cardInfo) {
        card.update(cardInfo);
        cardsRepository.save(card);
        actionsService.update(card);
    }

    public void delete(Long id) {
        cardsRepository.deleteById(id);
    }
}
