package com.codesquad.todoList.service;

import com.codesquad.todoList.entity.Card;
import com.codesquad.todoList.entity.Columns;
import com.codesquad.todoList.entity.Project;
import com.codesquad.todoList.error.exception.NotFoundCardException;
import com.codesquad.todoList.error.exception.NotFoundColumnException;
import com.codesquad.todoList.error.exception.NotFoundProjectException;
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
        Project project = projectRepository.findById(1L).orElseThrow(NotFoundProjectException::new);
        project.addColumn(columns);
        projectRepository.save(project);
    }

    @Transactional
    public void addCard(Long columnId, Card card) {
        Project project = projectRepository.findById(1L).orElseThrow(NotFoundProjectException::new);
        Columns columns = columnRepository.findById(columnId).orElseThrow(NotFoundColumnException::new);
        columns.addCard(card);
        updateColumn(columns, project);
        projectRepository.save(project);
    }

    @Transactional
    public void deleteCard(Long columnId, Long cardId) {
        Project project = projectRepository.findById(1L).orElseThrow(NotFoundProjectException::new);
        Columns columns = columnRepository.findById(columnId).orElseThrow(NotFoundColumnException::new);
        columns.deleteCard(cardId);
        updateColumn(columns, project);
        projectRepository.save(project);
    }

    @Transactional
    public void updateCard(Long columnId, Long cardId, Card card) {
        Project project = projectRepository.findById(1L).orElseThrow(NotFoundProjectException::new);
        Columns columns = columnRepository.findById(columnId).orElseThrow(NotFoundColumnException::new);

        Card updatedCard = null;

        for(Card beforeCard : columns.getCardList()) {
            if(beforeCard.getId().equals(cardId)) {
                updatedCard = beforeCard.update(card);
            }
        }

        if(updatedCard == null) {
            throw new NotFoundCardException();
        }

        updateColumn(columns, project);
        projectRepository.save(project);
    }

    @Transactional
    public void updateColumn(Long columnId, Columns columns) {
        Project project = projectRepository.findById(1L).orElseThrow(NotFoundProjectException::new);
        Columns beforeColumn = columnRepository.findById(columnId).orElseThrow(NotFoundColumnException::new);
        beforeColumn.updateColumn(columns);
        updateColumn(beforeColumn, project);
        projectRepository.save(project);
    }

    public List<Card> getColumn(Long id) {
       return columnRepository.findById(id).orElseThrow(NotFoundColumnException::new).getCardList();
    }

    private void updateColumn(Columns columns, Project project) {
        for(Columns column : project.getColumns()) {
            if(column.equals(columns)) {
                column.updateColumn(columns);
            }
        }
    }

}
