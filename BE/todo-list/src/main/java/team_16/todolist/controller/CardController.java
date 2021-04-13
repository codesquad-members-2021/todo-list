package team_16.todolist.controller;

import org.springframework.web.bind.annotation.*;
import team_16.todolist.domain.Board;
import team_16.todolist.domain.Card;
import team_16.todolist.repository.BoardRepository;
import team_16.todolist.service.BoardService;

@RestController
@RequestMapping("/{boardId}/cards")
public class CardController {

    private final BoardRepository boardRepository;

    private final BoardService boardService;

    public CardController(BoardService boardService) {
        this.boardService = boardService;
    }

    public CardController(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    @PostMapping
    public Card createdCard(@PathVariable Long boardId, Card newCard) {//String title, String content


        return boardService.createCard(boardId, newCard);
    }

    @PutMapping("/{cardId}")
    public Card updateCard(@PathVariable Long boardId, @PathVariable Long cardId, Card card) {

        return boardService.updateCard(boardId, cardId, card)
    }

    @DeleteMapping
    public void deleteCard(@PathVariable Long boardId, Card card) {
        Board board = boardRepository.findById(boardId).orElseThrow(IllegalArgumentException::new);
        board.deleteCard(card);
        boardRepository.save(board);
    }

}

