package com.team06.todo.dto;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ActionsResponse {

    private final List<ActionResponseDto> actionsResponse = new ArrayList<>();

    public ActionsResponse(List<ActionResponseDto> actionResponseDtos) {
        for (ActionResponseDto actionResponseDto : actionResponseDtos) {
            actionsResponse.add(actionResponseDto);
        }
    }

    public List<ActionResponseDto> getActionsResponse() {
        return Collections.unmodifiableList(actionsResponse);
    }
}