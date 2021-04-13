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
        Board board = new Board(title);
        boardRepository.save(board);
    }

    @GetMapping
    public Set<Board> getBoards() {

        return (Set<Board>) boardRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getBoard(@PathVariable Long id) {
        Set<Card> cards = boardRepository.findById(id).orElseThrow(IllegalArgumentException::new).getCards();

        return ResponseEntity.ok().body(cards);
    }

    @DeleteMapping("/{id}")
    public void deleteBoard(@PathVariable Long id) {
        boardRepository.deleteById(id);
    }


}
