package team10.todolist.service;

import org.springframework.stereotype.Service;
import sun.rmi.runtime.Log;
import team10.todolist.Category;
import team10.todolist.domain.Board;
import team10.todolist.dto.BoardDto;
import team10.todolist.repository.BoardRepository;
import team10.todolist.repository.LogRepository;

import java.util.List;

@Service
public class BoardService {

    private final BoardRepository boardRepository;
    private final LogRepository logRepository;

    public BoardService(BoardRepository boardRepository, LogRepository logRepository) {
        this.boardRepository = boardRepository;
        this.logRepository = logRepository;
    }

    public boolean create(BoardDto boardDto) {
        Board board = boardDto.toEntity();
        Log log = 
        boardRepository.save(board);
        return true;
    }

    public List<Board> readAll() {
        return boardRepository.findAllNotDeleted();
    }

    public List<Board> readByCategory(Category category) {
        return boardRepository.findByCategory(category.name());
    }

    public Board findBoardById(Long id) {
        return boardRepository.findById(id).orElseThrow(NullPointerException::new);
    }

    public boolean delete(Long id) {
        Board board = findBoardById(id);
        board.delete();
        boardRepository.save(board);
        return true;
    }

    public Board update(Long id, BoardDto boardDto) {
        Board board = findBoardById(id);
        board.update(boardDto);
        boardRepository.save(board);
        return board;
    }
}
