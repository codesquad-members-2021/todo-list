package com.team06.todo.service;

import com.team06.todo.domain.Action;
import com.team06.todo.domain.ActionType;
import com.team06.todo.domain.Card;
import com.team06.todo.dto.ActionsResponse;
import com.team06.todo.dto.ActionResponseDto;
import com.team06.todo.repository.ActionsRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ActionsService {

    private final ActionsRepository actionsRepository;

    public ActionsService(ActionsRepository actionsRepository) {
        this.actionsRepository = actionsRepository;
    }

    public void save(Card card) {
        actionsRepository.save(new Action(card.getTitle(), ActionType.ADD));
    }

    public void move(Card card, int columnFrom, int columnTo) {
        actionsRepository.save(new Action(card.getTitle(), columnFrom, columnTo, ActionType.MOVE));
    }

    public void update(Card card) {
        actionsRepository.save(new Action(card.getTitle(), ActionType.UPDATE));
    }

    public ActionsResponse show() {
        List<Action> actions = (List<Action>) actionsRepository.findAll();
//        List<ActionResponseDto> actionResponseDtos = new ArrayList<>();
//        for (Action action : actions) {
//            actionResponseDtos.add(new ActionResponseDto(action));
//        }
        return new ActionsResponse(actions.stream().map(ActionResponseDto::from).collect(Collectors.toList()));
    }

    public void delete(Card card) {
        actionsRepository.save(new Action(card.getTitle(), ActionType.DELETE));
    }
}
