package team_16.todolist.service;

import org.springframework.stereotype.Service;
import team_16.todolist.domain.Board;
import team_16.todolist.domain.Card;
import team_16.todolist.repository.BoardRepository;

import java.util.Optional;
import java.util.Set;


@Service
public class BoardService {
    private final BoardRepository boardRepository;

    public BoardService(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    public void saveBoard(String title) {
        Board board = new Board(title);
        boardRepository.save(board);
    }

    public Set<Board> getBoards() {
        return (Set<Board>) boardRepository.findAll();
    }

    public Set<Card> getCardsByBoardId(Long id) {
        Set<Card> cards = boardRepository.findById(id).orElseThrow(IllegalArgumentException::new).getCards();
        return cards;
    }

    public void removeBoard(Long id) {
        boardRepository.deleteById(id);
    }

    public Card createCard(Long boardId, Card card) {
        Board board = boardRepository.findById(boardId).orElseThrow(IllegalArgumentException::new);
        Card newCard = board.addCard(card.getTitle(), card.getContent());
        boardRepository.save(board);

        return newCard;
    }

    public Card updateCard(Long boardId, Long cardId, Card card) {
        Board board = boardRepository.findById(boardId).orElseThrow(IllegalArgumentException::new);
        Card updateCard = board.updateCard(cardId, card);
        boardRepository.save(board);

        return updateCard;
    }

    public void deleteCard(Long boardId, Card card) {
        Board board = boardRepository.findById(boardId).orElseThrow(IllegalArgumentException::new);
        board.deleteCard(card);
        boardRepository.save(board);
    }

}
