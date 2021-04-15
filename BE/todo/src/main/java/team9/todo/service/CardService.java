package team9.todo.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team9.todo.domain.Card;
import team9.todo.domain.History;
import team9.todo.domain.User;
import team9.todo.domain.enums.CardColumn;
import team9.todo.domain.enums.HistoryAction;
import team9.todo.exception.NotFoundException;
import team9.todo.repository.CardRepository;
import team9.todo.repository.HistoryRepository;

import java.util.List;

import static team9.todo.domain.Card.PRIORITY_STEP;

@Service
public class CardService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final CardRepository cardRepository;
    private final HistoryRepository historyRepository;

    @Autowired
    public CardService(CardRepository cardRepository, HistoryRepository historyRepository) {
        this.cardRepository = cardRepository;
        this.historyRepository = historyRepository;
    }

    private double getNextPriority(CardColumn cardColumn, User user) {
        double maxPriority = cardRepository.findMaxPriority(user.getId(), cardColumn).orElse(0.0);
        return maxPriority + PRIORITY_STEP;
    }

    @Transactional
    public Card create(String title, String content, CardColumn cardColumn, User user) {
        logger.debug("card 생성 요청: {}, {}, {}", cardColumn, title, content);

        double priority = getNextPriority(cardColumn, user);
        Card card = new Card(user.getId(), title, content, priority, cardColumn);
        Card saved = cardRepository.save(card);

        historyRepository.save(new History(saved.getId(), HistoryAction.ADD, null, saved.getColumnType()));
        return saved;
    }

    public List<Card> getList(CardColumn cardColumn, User user) {
        logger.debug("{}의 카드 목록 요청", cardColumn);
        return cardRepository.findAllByUserAndColumnTypeAndDeletedFalseOrderByPriority(user.getId(), cardColumn.name());
    }

    @Transactional
    public Card update(long cardId, String title, String content, User user) {
        logger.debug("{}번 카드의 내용 수정 요청", cardId);
        Card card = getCard(cardId, user);
        card.update(title, content);
        Card saved = cardRepository.save(card);

        historyRepository.save(new History(saved.getId(), HistoryAction.UPDATE, null, null));
        return saved;
    }

    private double renderPriority(Card prevCard, Card nextCard, CardColumn cardColumn, User user) {
        double priority = 0.0;
        if (prevCard == null && nextCard != null) {
            priority = nextCard.getPriority() - PRIORITY_STEP;
        }
        if (prevCard != null && nextCard == null) {
            priority = prevCard.getPriority() + PRIORITY_STEP;
        }
        if (prevCard != null && nextCard != null) {
            priority = (prevCard.getPriority() + nextCard.getPriority()) / 2;
        }
        if (prevCard == null && nextCard == null) {
            priority = getNextPriority(cardColumn, user);
        }
        return priority;
    }

    @Transactional
    public Card move(long cardId, Long prevCardId, Long nextCardId, CardColumn to, User user) {
        Card prevCard = null;
        Card nextCard = null;
        if (prevCardId != null) {
            prevCard = getCard(prevCardId, user);
            prevCard.validateColumn(to);
        }
        if (nextCardId != null) {
            nextCard = getCard(nextCardId, user);
            nextCard.validateColumn(to);
        }

        double priority = renderPriority(prevCard, nextCard, to, user);

        logger.debug("{}번 카드 {}로 이동 요청, 계산된 priority=", cardId, to, priority);

        Card card = getCard(cardId, user);

        CardColumn from = card.getColumnType();
        card.setColumnType(to);
        card.setPriority(priority);
        Card saved = cardRepository.save(card);

        if (from != to) {
            historyRepository.save(new History(saved.getId(), HistoryAction.MOVE, from, to));
        }
        return saved;
    }

    @Transactional
    public void delete(long cardId, User user) {
        logger.debug("{}번 카드의 삭제 요청", cardId);
        Card card = getCard(cardId, user);
        cardRepository.softDeleteById(cardId);

        historyRepository.save(new History(card.getId(), HistoryAction.REMOVE, card.getColumnType(), null));
    }

    private Card getCard(long cardId, User user) {
        Card card = cardRepository.findByIdAndDeletedFalse(cardId).orElseThrow(NotFoundException::new);
        card.validateOwner(user.getId());
        return card;
    }

    private boolean checkRebalance(double renderedPriority, Card prevCard, Card nextCard) {
        if (prevCard != null && renderedPriority == prevCard.getPriority()) {
            return true;
        }
        if (nextCard != null && renderedPriority == nextCard.getPriority()) {
            return true;
        }
        return false;
    }

    private void rebalancePriority(CardColumn cardColumn, User user) {
        List<Card> cards = getList(cardColumn, user);
        double priority = 0.0;
        for (Card card : cards) {
            priority += PRIORITY_STEP;
            card.setPriority(priority);
        }
        cardRepository.saveAll(cards);
    }
}
