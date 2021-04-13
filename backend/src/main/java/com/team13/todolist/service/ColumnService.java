package com.team13.todolist.service;

import com.team13.todolist.model.*;
import com.team13.todolist.repository.CardRepository;
import com.team13.todolist.repository.ColumnRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ColumnService {

    private final ColumnRepository columnRepository;
    private final CardRepository cardRepository;

    public ColumnService(ColumnRepository columnRepository, CardRepository cardRepository) {
        this.columnRepository = columnRepository;
        this.cardRepository = cardRepository;
    }

    public Column addColumn(String name) {
        Column column = Column.of(name, new HashMap<>());
        return columnRepository.save(column);
    }

    @Transactional
    public CardInfo addCard(Long columnId, Card card) {
        Column column = columnRepository.findById(columnId).orElseThrow(() -> new RuntimeException("Not Found"));
        Card newCard = cardRepository.save(card);
        column.addCard(newCard);
        column = columnRepository.save(column);
        return new CardInfo(column.getId(), newCard.getId(), 0L, newCard.getTitle(), newCard.getBody());
    }

    public ColumnInfo getColumn(Long columnId) {
        Column column = columnRepository.findById(columnId).orElseThrow(() -> new RuntimeException("Not Found"));
        Map<Long, CardRef> cardMap = column.getCards();
        List<CardInfo> cards = makeCardList(columnId, cardMap);
        return new ColumnInfo(columnId, column.getName(), cards);
    }

    private List<CardInfo> makeCardList(Long columnId, Map<Long, CardRef> cardMap) {
        List<CardInfo> cards = new ArrayList<>();
        Long previousCardId = 0L;
        CardRef cardRef;
        while ((cardRef = cardMap.get(previousCardId)) != null) {
            Card card = cardRepository.findById(cardRef.getCardId()).orElseThrow(() -> new RuntimeException("Not Found"));
            Long cardId = card.getId();
            CardInfo cardInfo = new CardInfo(columnId, cardId, previousCardId, card.getTitle(), card.getBody());
            cards.add(cardInfo);
            previousCardId = cardId;
        }
        return cards;
    }

    public List<ColumnInfo> getColumns() {
        List<Column> columns = columnRepository.findAll();
        List<ColumnInfo> ColumnInfoList = new ArrayList<>();
        for (Column column : columns) {
            ColumnInfoList.add(getColumn(column.getId()));
        }
        return ColumnInfoList;
    }

    public void removeCard(Long columnId, Long cardId) {
        Column column = columnRepository.findById(columnId).orElseThrow(() -> new RuntimeException("Not Found"));
        column.removeCard(cardId);
        columnRepository.save(column);
    }

    public CardInfo updateCard(Long columnId, Long cardId, UpdateCardParameter updateCardInfo) {
        Column column = columnRepository.findById(columnId).orElseThrow(() -> new RuntimeException("Not Found"));
        column.checkCardByPreviousId(updateCardInfo.getPreviousCardId(), cardId);
        Card oldCard = cardRepository.findById(cardId).orElseThrow(() -> new RuntimeException("Not Found"));
        oldCard.update(Card.of(updateCardInfo.getTitle(), updateCardInfo.getBody()));
        cardRepository.save(oldCard);
        return new CardInfo(columnId, cardId, updateCardInfo.getPreviousCardId(), updateCardInfo.getTitle(), updateCardInfo.getBody());
    }
}
