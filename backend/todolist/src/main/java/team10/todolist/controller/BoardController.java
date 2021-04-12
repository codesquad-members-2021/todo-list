package team10.todolist.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team10.todolist.domain.Board;
import team10.todolist.dto.BoardDto;
import team10.todolist.repository.BoardRepository;

@RestController
@RequestMapping("/board")
public class BoardController {

    private final BoardRepository boardRepository;

    public BoardController(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    @PostMapping("/lists")
    public Board create(@RequestBody BoardDto boardDto) {
        Board board = boardDto.toEntity();
        //cardRepository.save(card);
        return board;
    }
}
