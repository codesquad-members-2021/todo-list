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

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class HistoryService {
    private final HistoryRepository historyRepository;
    private final CardService cardService;
    private final UserService userService;

    @Autowired
    public HistoryService(HistoryRepository historyRepository, CardService cardService, UserService userService) {
        this.historyRepository = historyRepository;
        this.cardService = cardService;
        this.userService = userService;
    }

    public void save(History history) {
        historyRepository.save(history);
    }

    public List<HistoryDTO> historyList() {
        List<History> historyList = historyRepository.findHistoryList();
        return historyDtoList(historyList);
    }

    private List<HistoryDTO> historyDtoList(List<History> historyList) {
        List<HistoryDTO> result = new ArrayList<>();
        for (History history : historyList) {
            Object[] historyInfo = history.historyInfo();
            Card card = cardService.findCardById((Long) historyInfo[0]);
            User user = userService.findUserById(card.getUserId());
            CardLogDTO cardLogDto = new CardLogDTO(user, card.getTitle());
            HistoryDTO historyDto = new HistoryDTO(cardLogDto, (String) historyInfo[1], (String) historyInfo[2], (String) historyInfo[3], (LocalDateTime) historyInfo[4]);
            result.add(historyDto);
        }
        return result;
    }
}
