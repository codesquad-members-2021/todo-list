package team_16.todolist.controller;

import org.springframework.web.bind.annotation.*;
import team_16.todolist.domain.Card;
import team_16.todolist.service.BoardService;

@RestController
@RequestMapping("/{boardId}/cards")
public class CardController {

    private final BoardService boardService;

    public CardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @PostMapping
    public Card createdCard(@PathVariable Long boardId, Card newCard) {//String title, String content

        return boardService.createCard(boardId, newCard);
    }

    @PutMapping("/{cardId}")
    public Card updateCard(@PathVariable Long boardId, @PathVariable Long cardId, Card card) {

        return boardService.updateCard(boardId, cardId, card);
    }

    @DeleteMapping
    public void deleteCard(@PathVariable Long boardId, Card card) {
        boardService.deleteCard(boardId, card);
    }

}

