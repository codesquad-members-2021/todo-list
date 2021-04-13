package com.example.todolist;

import com.example.todolist.dto.CategoryDto;
import com.example.todolist.dto.HistoryDto;

import java.util.List;

public class ApiResponse {
    CategoryDto columns;
    List<HistoryDto> history;

    public ApiResponse(CategoryDto columns, List<HistoryDto> history) {
        this.columns = columns;
        this.history = history;
    }

    public CategoryDto getColumns() {
        return columns;
    }

    public List<HistoryDto> getHistory() {
        return history;
    }

    @Override
    public String toString() {
        return "ApiResponse{" +
                "columns=" + columns +
                ", history=" + history +
                '}';
    }
}
