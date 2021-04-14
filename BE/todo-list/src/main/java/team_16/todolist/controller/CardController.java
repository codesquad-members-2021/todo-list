package team_16.todolist.controller;

import org.springframework.web.bind.annotation.*;
import team_16.todolist.domain.Card;
import team_16.todolist.domain.Log;
import team_16.todolist.service.BoardService;
import team_16.todolist.service.LogService;

@RestController
@RequestMapping("/{boardId}/cards")
public class CardController {

    private final BoardService boardService;

    public CardController(BoardService boardService) {
        this.boardService = boardService;
    }

    /*
    Card객체를 매개변수로 받는것으로 수정 예정입니다.
    포스트맨 으로 테스트하기위해 title과 content로 받습니
     */
    @PostMapping
    public Card createdCard(@PathVariable Long boardId, String title, String content) {
        Card createdCard = boardService.createCard(boardId, title, content);

        return createdCard;
    }

    @PutMapping("/{cardId}")
    public Card updateCard(@PathVariable Long boardId, @PathVariable Long cardId, String title, String content) {

        return boardService.updateCard(boardId, cardId, title, content);
    }

    @PutMapping("/{cardId}/move/{moveBoardId}")
    public void moveCard(@PathVariable Long boardId, @PathVariable Long cardId, @PathVariable Long moveBoardId) {
        boardService.moveBoard(boardId, moveBoardId, cardId);
    }

    @DeleteMapping("/{cardId}")
    public void deleteCard(@PathVariable Long boardId, @PathVariable Long cardId) {
        boardService.deleteCard(boardId, cardId);
    }


}

