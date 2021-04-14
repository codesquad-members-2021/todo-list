package com.codesquad.todolist.service;

import com.codesquad.todolist.domain.Action;
import com.codesquad.todolist.domain.Card;
import com.codesquad.todolist.domain.History;
import com.codesquad.todolist.repository.CardRepository;
import com.codesquad.todolist.repository.HistoryRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
        double flag = 10;
        if (columnId == 1) {
            List<Double> flags = new ArrayList<>(cardRepository.findTodoFlags());
            if (flags.size() > 0) {
                flag = flags.get(flags.size() - 1) + 10;
            }
        }
        if (columnId == 2) {
            List<Double> flags = new ArrayList<>(cardRepository.findDoingFlags());
            if (flags.size() > 0) {
                flag = flags.get(flags.size() - 1) + 10;
            }
        }
        if (columnId == 3) {
            List<Double> flags = new ArrayList<>(cardRepository.findDoneFlags());
            if (flags.size() > 0) {
                flag = flags.get(flags.size() - 1) + 10;
            }
        }
        Card card = new Card(title, contents, columnId, flag);
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

    public Card move(Long id, Long toColumnId, int index) {
        Card card = findCard(id);
        Long fromColumnId = card.getColumnId();
        double flag = 0;
        if (toColumnId == 1) {
            List<Double> flags = new ArrayList<>(cardRepository.findTodoFlags());
            flag = updateFlag(flags, index);
        }
        if (toColumnId == 2) {
            List<Double> flags = new ArrayList<>(cardRepository.findTodoFlags());
            flag = updateFlag(flags, index);
        }
        if (toColumnId == 3) {
            List<Double> flags = new ArrayList<>(cardRepository.findTodoFlags());
            flag = updateFlag(flags, index);
        }
        card.move(toColumnId, flag);
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
