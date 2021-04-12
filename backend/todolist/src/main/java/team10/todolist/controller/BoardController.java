package team10.todolist.controller;

import org.springframework.web.bind.annotation.*;
import team10.todolist.domain.Board;
import team10.todolist.dto.BoardDto;
import team10.todolist.service.BoardService;

import java.util.List;

@RestController
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @PostMapping("/lists")
    public boolean create(@RequestBody BoardDto boardDto) {
        return boardService.create(boardDto);
    }

    @GetMapping("/lists")
    public List<Board> readAll(){
        return boardService.readAll();
    }

}
