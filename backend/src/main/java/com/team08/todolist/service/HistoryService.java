package com.team08.todolist.service;

import com.team08.todolist.dto.CardDto;
import com.team08.todolist.model.History;
import com.team08.todolist.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class HistoryService {

    private final HistoryRepository historyRepository;

    @Autowired
    public HistoryService(HistoryRepository historyRepository) {
        this.historyRepository = historyRepository;
    }

    public List<History> findAll() {
        return historyRepository.findAll();
    }

    public void generateAdd(CardDto cardDto) {
        History history = new History(null, "august17", cardDto.getTitle(), "add", null, getColumnType(cardDto.getColumnId()), LocalDateTime.now());
        historyRepository.save(history);
    }

    public void generateRemove(CardDto cardDto) {
        History history = new History(null, "august17", cardDto.getTitle(), "remove", null, getColumnType(cardDto.getColumnId()), LocalDateTime.now());
        historyRepository.save(history);
    }

    public void generateUpdate(CardDto cardDto) {
        History history = new History(null, "august17", cardDto.getTitle(), "update", null, getColumnType(cardDto.getColumnId()), LocalDateTime.now());
        historyRepository.save(history);
    }

    public void generateMove(Long columnId, CardDto cardDto) {
        History history = new History(null, "august17", cardDto.getTitle(), "move", getColumnType(columnId), getColumnType(cardDto.getColumnId()), LocalDateTime.now());
        historyRepository.save(history);
    }

    private String getColumnType(Long columnId) {
        if (columnId == 1L) {
            return "ToDo";
        } else if (columnId == 2L) {
            return "Doing";
        } else if (columnId == 3L) {
            return "Done";
        }
        return "None";
    }
}
