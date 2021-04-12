package com.codesquad.todolist.service;

import com.codesquad.todolist.domain.Action;
import com.codesquad.todolist.domain.Card;
import com.codesquad.todolist.domain.History;
import com.codesquad.todolist.repository.CardRepository;
import com.codesquad.todolist.repository.HistoryRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardService {

    private final CardRepository cardRepository;
    private final HistoryRepository historyRepository;

    public CardService(CardRepository cardRepository, HistoryRepository historyRepository) {
        this.cardRepository = cardRepository;
        this.historyRepository = historyRepository;
    }

    public List<Card> viewCardByColumnId(Long columnId) {
        if (columnId == 1) {
            return cardRepository.findTodoCards();
        }
        if (columnId == 2) {
            return cardRepository.findDoingCards();
        }
        if (columnId == 3) {
            return cardRepository.findDoneCards();
        }
        return null;
    }

    public Card create(Long columnId, String title, String contents) {
        Card card = new Card(title, contents, columnId);
        cardRepository.save(card);
        createHistory(Action.ADD.toString(), title, columnId, null);
        return card;
    }

    public Card update(Long id, String title, String contents) {
        Card card = findCard(id);
        card.update(title, contents);
        cardRepository.save(card);
        createHistory(Action.UPDATE.toString(), title, card.getColumnId(), null);
        return card;
    }

    public void delete(Long id) {
        Card card = findCard(id);
        cardRepository.delete(card);
        createHistory(Action.REMOVE.toString(), card.getTitle(), card.getColumnId(), null);
    }

    public Card move(Long id, Long toColumnId) {
        Card card = findCard(id);
        Long fromColumnId = card.getColumnId();
        card.move(toColumnId);
        cardRepository.save(card);
        createHistory(Action.MOVE.toString(), card.getTitle(), fromColumnId, toColumnId);
        return card;
    }

    private void createHistory(String action, String title, Long fromColumnId, Long toColumnId) {
        History history = new History(action, title, fromColumnId, toColumnId);
        historyRepository.save(history);
    }

    private Card findCard(Long id) {
        return cardRepository.findById(id).orElse(null);
    }
}
