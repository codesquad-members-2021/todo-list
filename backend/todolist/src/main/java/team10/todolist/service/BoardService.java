package team10.todolist.service;

import org.springframework.stereotype.Service;
import team10.todolist.Category;
import team10.todolist.domain.Board;
import team10.todolist.dto.BoardDto;
import team10.todolist.repository.BoardRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class BoardService {

    private final BoardRepository boardRepository;

    public BoardService(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    public boolean create(BoardDto boardDto) {
        Board board = boardDto.toEntity();
        boardRepository.save(board);
        return true;
    }

    public List<Board> readAll() {
        return iterableToList(boardRepository.findAll());
    }

    public List<Board> readByCategory(Category category) {
        return iterableToList(boardRepository.findByCategory(category.name()));
    }

    private List<Board> iterableToList(Iterable<Board> iterable) {
        List<Board> boards = new ArrayList<>();
        iterable.forEach(boards::add);
        return boards;
    }
}
