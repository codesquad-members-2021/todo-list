package com.team06.todo.service;

import com.team06.todo.domain.Action;
import com.team06.todo.domain.Card;
import com.team06.todo.domain.ColumnType;
import com.team06.todo.repository.ActionsRepository;
import org.springframework.stereotype.Service;

@Service
public class ActionsService {

    private final ActionsRepository actionsRepository;

    public ActionsService(ActionsRepository actionsRepository) {
        this.actionsRepository = actionsRepository;
    }

    public void save(Card card) {
        actionsRepository.save(new Action(card.getId(), Action.ActionType.ADD));
    }

    public void move(Card card, ColumnType columnFrom, ColumnType columnTo) {
        actionsRepository.save(new Action(card.getId(), columnFrom, columnTo, Action.ActionType.MOVE));
    }

    public void update(Card card) {
        actionsRepository.save(new Action(card.getId(), Action.ActionType.UPDATE));
    }
}
