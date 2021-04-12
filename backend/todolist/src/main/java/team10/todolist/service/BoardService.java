package team10.todolist.service;

import org.springframework.stereotype.Service;
import team10.todolist.domain.Board;
import team10.todolist.dto.BoardDto;
import team10.todolist.repository.BoardRepository;

@Service
public class BoardService {

    private final BoardRepository boardRepository;

    public BoardService(BoardRepository boardRepository){
        this.boardRepository = boardRepository;
    }

    public boolean create(BoardDto boardDto){
        Board board = boardDto.toEntity();
        boardRepository.save(board);
        return true;
    }
}
