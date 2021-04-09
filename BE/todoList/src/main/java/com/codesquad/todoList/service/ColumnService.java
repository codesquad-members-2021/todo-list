package com.codesquad.todoList.service;

import com.codesquad.todoList.entity.Card;
import com.codesquad.todoList.entity.Columns;
import com.codesquad.todoList.repository.ColumnRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class ColumnService {

    private static final Logger log = LoggerFactory.getLogger(ColumnService.class);

    ColumnRepository columnRepository;

    @Autowired
    public ColumnService(ColumnRepository columnRepository) {
        this.columnRepository = columnRepository;
    }

    @Transactional
    public void addColumn(Columns columns) {
        columnRepository.save(columns);
    }

    @Transactional
    public void addCard(Long columnId, Card card) {
        Columns columns = columnRepository.findById(columnId).orElseThrow(IllegalArgumentException::new);
        columns.addCard(card);
        columnRepository.save(columns);
    }

    @Transactional
    public boolean delete(Long columnId, Long cardId) {
        Columns columns = columnRepository.findById(columnId).orElseThrow(IllegalArgumentException::new);
        columns.deleteCard(cardId);
        columnRepository.save(columns);
        return true;
    }

    @Transactional
    public Card updateCard(Long columnId, Long cardId, Card card) {
        Columns columns = columnRepository.findById(columnId).orElseThrow(IllegalArgumentException::new);
        Card updatedCard = null;
        for(Card beforeCard : columns.getCardList()) {
            if(beforeCard.getId().equals(cardId)) {
                updatedCard = beforeCard.update(card);
            }
        }
        columnRepository.save(columns);
        return updatedCard;
    }

    @Transactional
    public void updateColumn(Long columnId, Columns columns) {
        Columns beforeColumn = columnRepository.findById(columnId).orElseThrow(IllegalArgumentException::new);
        beforeColumn.updateColumn(columns);
        columnRepository.save(beforeColumn);
    }

    public List<Card> getColumn(Long id) {
       return columnRepository.findById(id).orElseThrow(IllegalArgumentException::new).getCardList();
    }

}
