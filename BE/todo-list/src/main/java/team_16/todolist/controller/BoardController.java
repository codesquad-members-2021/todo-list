package team_16.todolist.controller;

import org.springframework.web.bind.annotation.*;
import team_16.todolist.domain.Board;
import team_16.todolist.domain.Card;
import team_16.todolist.service.BoardService;
import java.util.Set;

@RestController
@RequestMapping("/boards")
public class BoardController {

    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @PostMapping
    public void createBoard(String title) {
        boardService.saveBoard(title);
    }

    @GetMapping
    public Set<Board> getBoards() {

        return boardService.getBoards();
    }

    @GetMapping("/{id}")
    public Set<Card> getCardByBoardId(@PathVariable Long id) {

        return boardService.getCardsByBoardId(id);
    }

    @DeleteMapping("/{id}")
    public void deleteBoard(@PathVariable Long id) {
        boardService.removeBoard(id);
    }


}
