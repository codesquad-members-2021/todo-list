package com.example.todolist.dto;

import java.util.List;

public class HistoryListDto {
    private List<HistoryDto> history;

    public HistoryListDto(){}

    public HistoryListDto(List<HistoryDto> history) {
        this.history = history;
    }

    public List<HistoryDto> getHistory() {
        return history;
    }
}
