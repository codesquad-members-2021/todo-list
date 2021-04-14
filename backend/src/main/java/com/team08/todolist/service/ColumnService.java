package com.team08.todolist.service;

import com.team08.todolist.model.Card;
import com.team08.todolist.model.Column;
import com.team08.todolist.repository.ColumnRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class ColumnService {

    private final ColumnRepository columnRepository;

    @Autowired
    public ColumnService(ColumnRepository columnRepository) {
        this.columnRepository = columnRepository;
    }

    public Set<Card> list(Long columnId){
        Column column = columnRepository.findById(columnId)
                .orElseThrow(() -> new IllegalArgumentException("Failed to add card to column"));

        return column.getCards();
    }


}
