package com.codesquad.todolist.service;

import com.codesquad.todolist.domain.Action;
import com.codesquad.todolist.domain.History;
import com.codesquad.todolist.repository.HistoryRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryService {

    private final HistoryRepository historyRepository;

    public HistoryService(HistoryRepository historyRepository) {
        this.historyRepository = historyRepository;
    }

    public void createHistory(Action action, String title, Long fromColumnId, Long toColumnId) {
        History history = History.createHistory(action, title, fromColumnId, toColumnId);
        historyRepository.save(history);
    }

    public List<History> findHistory() {
        List<History> history = (List<History>) historyRepository.findAll();
        return history;
    }
}
