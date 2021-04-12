package team10.todolist.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team10.todolist.dto.BoardDto;
import team10.todolist.service.BoardService;

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
}
