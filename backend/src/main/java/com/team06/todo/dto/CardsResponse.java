package com.team06.todo.dto;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CardsResponse {

    private final List<CardResponseDto> cardsResponse = new ArrayList<>();

    public CardsResponse(List<CardResponseDto> cardResponseDtos) {
        for (CardResponseDto cardResponseDto : cardResponseDtos) {
            cardsResponse.add(cardResponseDto);
        }
    }

    public List<CardResponseDto> getCardsResponse() {
        return Collections.unmodifiableList(cardsResponse);
    }
}
