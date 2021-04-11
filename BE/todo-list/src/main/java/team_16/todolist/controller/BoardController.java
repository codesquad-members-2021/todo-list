package team_16.todolist.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import team_16.todolist.domain.Board;
import team_16.todolist.domain.Card;
import team_16.todolist.repository.BoardRepository;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/boards")
public class BoardController {

    private final BoardRepository boardRepository;

    public BoardController(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    @PostMapping
    public void createBoard(String title) {
        Board board = new Board();
        board.title = title;
        boardRepository.save(board);
    }

    @GetMapping
    public List<Board> getBoards() {
        System.out.println("BoardController.getBoards");
        return (List<Board>) boardRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getBoard(@PathVariable Long id) {
        Set<Card> boards = boardRepository.findById(id).get().getCards();

        return ResponseEntity.ok().body(boards);
    }

    @DeleteMapping("/{id}")
    public void deleteBoard(@PathVariable Long id) {
        boardRepository.deleteById(id);
    }


}
