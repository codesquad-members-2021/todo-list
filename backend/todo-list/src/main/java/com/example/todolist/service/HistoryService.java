package com.example.todolist.service;

import com.example.todolist.domain.Card;
import com.example.todolist.domain.History;
import com.example.todolist.domain.User;
import com.example.todolist.dto.CardLogDTO;
import com.example.todolist.dto.HistoryDTO;
import com.example.todolist.repository.CardRepository;
import com.example.todolist.repository.HistoryRepository;
import com.example.todolist.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HistoryService {
    private final HistoryRepository historyRepository;
    private final CardRepository cardRepository;
    private final UserRepository userRepository;

    @Autowired
    public HistoryService(HistoryRepository historyRepository, CardRepository cardRepository, UserRepository userRepository) {
        this.historyRepository = historyRepository;
        this.cardRepository = cardRepository;
        this.userRepository = userRepository;
    }

    public List<HistoryDTO> historyList() {
        List<History> historyList = historyRepository.findHistoryList();
        return historyDtoList(historyList);
    }

    private List<HistoryDTO> historyDtoList(List<History> historyList) {
        List<HistoryDTO> result = new ArrayList<>();
        for (History history : historyList) {
            Card card = cardRepository.findById(history.getCardId()).orElseThrow(RuntimeException::new);
            User user = userRepository.findById(card.getUserId()).orElseThrow(RuntimeException::new);
            CardLogDTO cardLogDto = new CardLogDTO(user, card.getTitle());
            HistoryDTO historyDto = new HistoryDTO(cardLogDto, history.getAction(), history.getPreStatus(), history.getCurrStatus(), history.getActionTime());
            result.add(historyDto);
        }
        return result;
    }
}
