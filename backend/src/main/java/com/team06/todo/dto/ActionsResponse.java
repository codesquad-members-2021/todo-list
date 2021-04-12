package com.team06.todo.dto;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ActionsResponse {

    private final List<ActionsResponseDto> actionsResponse = new ArrayList<>();

    public ActionsResponse(List<ActionsResponseDto> actionsResponseDtos) {
        for (ActionsResponseDto actionsResponseDto : actionsResponseDtos) {
            actionsResponse.add(actionsResponseDto);
        }
    }

    public List<ActionsResponseDto> getActionsResponse() {
        return Collections.unmodifiableList(actionsResponse);
    }
}