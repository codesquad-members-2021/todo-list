package com.codesquad.todoList.dto;

import com.codesquad.todoList.entity.Card;
import lombok.Data;

@Data
public class CardInfoData {

    private final Long columnId;
    private final String cardId;

}
