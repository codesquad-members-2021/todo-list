package team9.todo.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team9.todo.domain.Card;
import team9.todo.domain.User;
import team9.todo.domain.enums.CardColumn;
import team9.todo.exception.NotAuthorizedException;
import team9.todo.repository.CardRepository;

import java.util.List;

@Service
public class CardService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final CardRepository cardRepository;

    @Autowired
    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    public Card create(Card card, User user) {
        logger.debug("card 생성 요청: {}, {}, {}", card.getColumnType(), card.getTitle(), card.getContent());
        card.setUser(user.getId());
        return cardRepository.save(card);
    }

    public List<Card> getList(CardColumn cardColumn, User user) {
        logger.debug("{}의 카드 목록 요청", cardColumn);
        return cardRepository.findAllByUserAndColumnType(user.getId(), cardColumn.name());
    }


    public Card update(long cardId, Card card, User user) {
        logger.debug("{}번 카드의 내용 수정 요청", cardId);
        Card toUpdate = cardRepository.findById(cardId).get();
        if (toUpdate.getUser() != user.getId()) {
            throw new NotAuthorizedException();
        }
        toUpdate.update(card);
        return cardRepository.save(toUpdate);
    }

    public void delete(long cardId, User user) {
        logger.debug("{}번 카드의 삭제 요청", cardId);
        Card card = cardRepository.findById(cardId).get();
        if (card.getUser() != user.getId()) {
            throw new NotAuthorizedException();
        }
        cardRepository.delete(card);
    }
}
