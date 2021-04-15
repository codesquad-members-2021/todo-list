package team_16.todolist.service;

import org.springframework.stereotype.Service;
import team_16.todolist.domain.Board;
import team_16.todolist.domain.Log;
import team_16.todolist.repository.BoardRepository;
import team_16.todolist.repository.LogRepository;

import java.util.Set;

@Service
public class LogService {
    private final LogRepository logRepository;
    private final BoardRepository boardRepository;

    public LogService(LogRepository logRepository, BoardRepository boardRepository) {
        this.logRepository = logRepository;
        this.boardRepository = boardRepository;
    }

    public void createLog(Log.Action action, Long cardId, Long currentBoardId) {
        Board currentBoard = boardRepository.findById(currentBoardId).orElseThrow(IllegalArgumentException::new);
        String cardTitle = currentBoard.getCard(cardId).getTitle();

        Log log = Log.createLog(action, cardTitle, currentBoard.getTitle());
        saveLog(log);
    }

    public void createLogByPreviousBoardId(Log.Action action, Long cardId, Long previousBoardId, Long currentBoardId) {
        Board currentBoard = boardRepository.findById(currentBoardId).orElseThrow(IllegalArgumentException::new);
        Board previousBoard = boardRepository.findById(previousBoardId).orElseThrow(IllegalArgumentException::new);

        String cardTitle = previousBoard.getCard(cardId).getTitle();

        Log log = Log.createLogByMoveBoard(action, cardTitle, currentBoard.getTitle(), previousBoard.getTitle());

        saveLog(log);

    }

    public Set<Log> findAll() {
        return logRepository.findAll();
    }

    public void saveLog(Log log) {
        logRepository.save(log);
    }
}
