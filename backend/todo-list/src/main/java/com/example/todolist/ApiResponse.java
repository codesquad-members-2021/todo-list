package com.example.todolist;

import com.example.todolist.dto.CategoryDto;
import com.example.todolist.dto.HistoryDto;

import java.util.List;

public class ApiResponse {
    CategoryDto columns;
    List<HistoryDto> history;
    String jwtToken;

    public ApiResponse(CategoryDto columns, List<HistoryDto> history, String jwtToken) {
        this.columns = columns;
        this.history = history;
        this.jwtToken = jwtToken;
    }

    public CategoryDto getColumns() {
        return columns;
    }

    public List<HistoryDto> getHistory() {
        return history;
    }

    public String getJwtToken() {
        return jwtToken;
    }

    @Override
    public String toString() {
        return "ApiResponse{" +
                "columns=" + columns +
                ", history=" + history +
                '}';
    }
}
