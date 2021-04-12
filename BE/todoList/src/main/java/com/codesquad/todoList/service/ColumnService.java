package com.codesquad.todoList.service;

import com.codesquad.todoList.entity.Card;
import com.codesquad.todoList.entity.Columns;
import com.codesquad.todoList.entity.Project;
import com.codesquad.todoList.repository.ColumnRepository;
import com.codesquad.todoList.repository.ProjectRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ColumnService {

    private static final Logger log = LoggerFactory.getLogger(ColumnService.class);

    private final ColumnRepository columnRepository;
    private final ProjectRepository projectRepository;

    @Transactional
    public void addColumn(Columns columns) {
        Project project = projectRepository.findById(1L).orElseThrow(IllegalArgumentException::new);
        project.addColumn(columns);
        projectRepository.save(project);
    }

    @Transactional
    public void addCard(Long columnId, Card card) {
        Project project = projectRepository.findById(1L).orElseThrow(IllegalArgumentException::new);
        Columns columns = columnRepository.findById(columnId).orElseThrow(IllegalArgumentException::new);
        columns.addCard(card);
        for(Columns c : project.getColumns()) {
            if(c.equals(columns)) {
                c.updateColumn(columns);
            }
        }
        projectRepository.save(project);
    }

    @Transactional
    public boolean delete(Long columnId, Long cardId) {
        Project project = projectRepository.findById(1L).orElseThrow(IllegalArgumentException::new);
        Columns columns = columnRepository.findById(columnId).orElseThrow(IllegalArgumentException::new);
        columns.deleteCard(cardId);
        for(Columns c : project.getColumns()) {
            if(c.equals(columns)) {
                c.updateColumn(columns);
            }
        }
        projectRepository.save(project);
        return true;
    }

    @Transactional
    public Card updateCard(Long columnId, Long cardId, Card card) {
        Project project = projectRepository.findById(1L).orElseThrow(IllegalArgumentException::new);
        Columns columns = columnRepository.findById(columnId).orElseThrow(IllegalArgumentException::new);
        Card updatedCard = null;

        for(Card beforeCard : columns.getCardList()) {
            if(beforeCard.getId().equals(cardId)) {
                updatedCard = beforeCard.update(card);
            }
        }

        for(Columns c : project.getColumns()) {
            if(c.equals(columns)) {
                c.updateColumn(columns);
            }
        }
        projectRepository.save(project);
        return updatedCard;
    }

    @Transactional
    public void updateColumn(Long columnId, Columns columns) {
        Project project = projectRepository.findById(1L).orElseThrow(IllegalArgumentException::new);
        Columns beforeColumn = columnRepository.findById(columnId).orElseThrow(IllegalArgumentException::new);
        beforeColumn.updateColumn(columns);
        for(Columns c : project.getColumns()) {
            if(c.equals(beforeColumn)) {
                c.updateColumn(beforeColumn);
            }
        }
        projectRepository.save(project);
    }

    public List<Card> getColumn(Long id) {
       return columnRepository.findById(id).orElseThrow(IllegalArgumentException::new).getCardList();
    }

}
