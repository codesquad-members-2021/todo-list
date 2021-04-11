package team_16.todolist.service;

import org.springframework.stereotype.Service;
import team_16.todolist.repository.BoardRepository;


@Service
public class BoardService {
    private final BoardRepository boardRepository;

    public BoardService(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }
    
}
