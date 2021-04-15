package com.codesquad.todolist.service;

import com.codesquad.todolist.domain.Action;
import com.codesquad.todolist.domain.Card;
import com.codesquad.todolist.repository.CardRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CardService {

    private final CardRepository cardRepository;
    private final HistoryService historyService;

    public CardService(CardRepository cardRepository, HistoryService historyService) {
        this.cardRepository = cardRepository;
        this.historyService = historyService;
    }

    public List<Card> viewCardByColumnId(Long columnId) {
        return cardRepository.findCardsByColumnId(columnId);
    }

    public Card create(Long columnId, String title, String contents) {
        double flag = 10;
        List<Double> flags = new ArrayList<>(cardRepository.findFlagsByColumnId(columnId));
        if (flags.size() > 0) {
            flag = flags.get(flags.size() - 1) + 10;
        }
        Card card = new Card(title, contents, columnId, flag);
        cardRepository.save(card);
        historyService.createHistory(Action.ADD, title, columnId, 0L);
        return card;
    }

    public Card update(Long id, String title, String contents) {
        Card card = findCard(id);
        card.update(title, contents);
        cardRepository.save(card);
        historyService.createHistory(Action.UPDATE, title, card.getColumnId(), 0L);
        return card;
    }

    public void delete(Long id) {
        Card card = findCard(id);
        cardRepository.delete(card);
        historyService.createHistory(Action.REMOVE, card.getTitle(), card.getColumnId(), 0L);
    }

    public Card move(Long id, Long toColumnId, int index) {
        Card card = findCard(id);
        Long fromColumnId = card.getColumnId();
        double flag = 0;
        List<Double> flags = new ArrayList<>(cardRepository.findFlagsByColumnId(toColumnId));
        flag = updateFlag(flags, index);
        card.move(toColumnId, flag);
        cardRepository.save(card);
        historyService.createHistory(Action.MOVE, card.getTitle(), fromColumnId, toColumnId);
        return card;
    }

    public void nullCheck(String title, String contents) {
        if (title == null || title.trim().length() == 0) {
            throw new NullPointerException("title can't be null");
        }
        if (contents == null || contents.trim().length() == 0) {
            throw new NullPointerException("contents can't be null");
        }
    }

    private Card findCard(Long id) {
        return cardRepository.findById(id).orElseThrow(
                () -> new IllegalArgumentException());
    }

    private Double updateFlag(List<Double> flags, int index) {
        double flag = 0;
        if (flags.size() == 0) {
            flag = 10.0;
            return flag;
        }
        if (index == 1) {
            flag = (0 + flags.get(0)) / 2;
            return flag;
        }
        if (flags.size() < index) {
            flag = flags.get(flags.size() - 1) + 10;
            return flag;
        }
        flag = (flags.get(index - 2) + flags.get(index - 1)) / 2;
        return flag;
    }

}
