package com.team08.todolist.service;

import com.team08.todolist.ColumnType;
import com.team08.todolist.dto.CardDto;
import com.team08.todolist.model.History;
import com.team08.todolist.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class HistoryService {

    private final HistoryRepository historyRepository;

    @Autowired
    public HistoryService(HistoryRepository historyRepository) {
        this.historyRepository = historyRepository;
    }

    @Transactional(readOnly = true)
    public List<History> findAll() {
        return historyRepository.findAll();
    }

    @Transactional
    public void generateAdd(CardDto cardDto) {
        History history = new History(null, "august17", cardDto.getTitle(), "add", null, ColumnType.type(cardDto.getColumnId()), LocalDateTime.now());
        historyRepository.save(history);
    }

    @Transactional
    public void generateRemove(CardDto cardDto) {
        History history = new History(null, "august17", cardDto.getTitle(), "remove", null, ColumnType.type(cardDto.getColumnId()), LocalDateTime.now());
        historyRepository.save(history);
    }

    @Transactional
    public void generateUpdate(CardDto cardDto) {
        History history = new History(null, "august17", cardDto.getTitle(), "update", null, ColumnType.type(cardDto.getColumnId()), LocalDateTime.now());
        historyRepository.save(history);
    }

    @Transactional
    public void generateMove(Long columnId, CardDto cardDto) {
        History history = new History(null, "august17", cardDto.getTitle(), "move", ColumnType.type(columnId), ColumnType.type(cardDto.getColumnId()), LocalDateTime.now());
        historyRepository.save(history);
    }

}
