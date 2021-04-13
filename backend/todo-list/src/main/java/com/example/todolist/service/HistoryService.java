package com.example.todolist.service;

import com.example.todolist.domain.Card;
import com.example.todolist.domain.History;
import com.example.todolist.domain.User;
import com.example.todolist.dto.CardLogDto;
import com.example.todolist.dto.HistoryDto;
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

    public List<HistoryDto> historyList() {
        List<History> historyList = historyRepository.findHistoryList();
        System.out.println(historyList.toString());
        return historyDtoList(historyList);
    }

    private List<HistoryDto> historyDtoList(List<History> historyList) {
        List<HistoryDto> result = new ArrayList<>();
        for (History history : historyList) {
            Card card = cardRepository.findById(history.getCardId()).orElseThrow(RuntimeException::new);
            User user = userRepository.findById(card.getUserId()).orElseThrow(RuntimeException::new);
            CardLogDto cardLogDto = new CardLogDto(user, card.getTitle());
            HistoryDto historyDto = new HistoryDto(cardLogDto,history.getAction(),history.getPreStatus(),history.getCurrStatus(),history.getActionTime());
            result.add(historyDto);
        }
        return result;
    }

    public HistoryRepository getHistoryRepository() {
        return historyRepository;
    }

    public CardRepository getCardRepository() {
        return cardRepository;
    }

    public UserRepository getUserRepository() {
        return userRepository;
    }
}
