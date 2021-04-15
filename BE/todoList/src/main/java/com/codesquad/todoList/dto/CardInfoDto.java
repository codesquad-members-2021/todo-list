package com.codesquad.todoList.dto;

import com.codesquad.todoList.entity.Card;
import com.codesquad.todoList.entity.Columns;
import com.codesquad.todoList.entity.Project;
import lombok.Getter;

@Getter
public class CardInfoDto {

    private Long cardId;
    private String title;
    private String content;
    private String author;

    public CardInfoDto(Project project, Long columnId) {
        parsingCardInfo(project, columnId);
    }

    private void parsingCardInfo(Project project, Long columnId) {
        for (Columns columns1 : project.getColumns()) {
            if (columns1.getId().equals(columnId)) {
                for (Card card : columns1.getCardList()) {
                    this.cardId = card.getId();
                    this.title = card.getTitle();
                    this.content = card.getContent();
                    this.author = card.getAuthor();
                }
            }
        }
    }
}
