package team10.todolist.service;

import org.springframework.stereotype.Service;
import team10.todolist.domain.Board;
import team10.todolist.dto.BoardDto;
import team10.todolist.repository.BoardRepository;

import java.util.ArrayList;
import java.util.List;

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

    public List<Board> readAll(){
        Iterable<Board> boardIterable = boardRepository.findAll();
        List<Board> boards = new ArrayList<>();
        boardIterable.forEach(boards::add);
        return boards;
    }
}
