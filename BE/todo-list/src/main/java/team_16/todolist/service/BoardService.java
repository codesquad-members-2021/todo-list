package team_16.todolist.service;

import org.springframework.stereotype.Service;
import team_16.todolist.domain.Board;
import team_16.todolist.domain.Card;
import team_16.todolist.domain.Log;
import team_16.todolist.repository.BoardRepository;

import java.util.Set;


@Service
public class BoardService {

    private final LogService logService;
    private final BoardRepository boardRepository;

    public BoardService(LogService logService, BoardRepository boardRepository) {
        this.logService = logService;
        this.boardRepository = boardRepository;
    }

    public void saveBoard(String title) {
        Board board = new Board(title);
        boardRepository.save(board);
    }

    public Set<Board> getBoards() {
        return boardRepository.findAll();
    }

    public Set<Card> getCardsByBoardId(Long id) {
        Set<Card> cards = boardRepository.findById(id).orElseThrow(IllegalArgumentException::new).getCards();

        return cards;
    }

    public void removeBoard(Long id) {
        boardRepository.deleteById(id);
    }

    public Card createCard(Long boardId, String title, String content) {
        Board board = boardRepository.findById(boardId).orElseThrow(IllegalArgumentException::new);
        Card newCard = board.addCard(title, content);
        boardRepository.save(board);

        logService.createLog(Log.Action.ADD, newCard.getId(), boardId);

        return newCard;
    }

    public Card updateCard(Long boardId, Long cardId, String title, String content) {
        Board board = boardRepository.findById(boardId).orElseThrow(IllegalArgumentException::new);
        Card updateCard = board.updateCard(cardId, title, content);
        boardRepository.save(board);

        logService.createLog(Log.Action.UPDATE, cardId, boardId);

        return updateCard;
    }

    public void moveBoard(Long boardId, Long moveBoardId, Long cardId) {
        logService.createLogByPreviousBoardId(Log.Action.MOVE, cardId, boardId, moveBoardId);

        Board board = boardRepository.findById(boardId).orElseThrow(IllegalArgumentException::new);
        Board moveBoard = boardRepository.findById(moveBoardId).orElseThrow(IllegalArgumentException::new);

        Card card = board.getCard(cardId);
        deleteCard(boardId, cardId);

        moveBoard.addCard(card.getTitle(), card.getContent());
        boardRepository.save(moveBoard);
    }

    public void deleteCard(Long boardId, Long cardId) {
        logService.createLog(Log.Action.REMOVE, cardId, boardId);

        Board board = boardRepository.findById(boardId).orElseThrow(IllegalArgumentException::new);
        board.deleteCard(cardId);
        boardRepository.save(board);
    }

}
