package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.dto.CardDto;
import com.codeSquad.cocokyu.domain.dto.CardList;
import com.codeSquad.cocokyu.domain.dto.LogList;
import com.codeSquad.cocokyu.domain.model.Card;
import com.codeSquad.cocokyu.domain.model.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class CardService {

    private final CardRepository cardRepository;
    private final LogRepository logRepository;

    public CardService(CardRepository cardRepository, LogRepository logRepository) {
        this.cardRepository = cardRepository;
        this.logRepository = logRepository;
    }

    @Transactional
    public void createCard(Card card) {
        cardRepository.save(card);
    }

    public CardList sortedList() {
        List<Card> cards = cardRepository.findByCardToNotDeleted();
        CardList.Builder builder = new CardList.Builder();
        for (Card card : cards) {
            builder.addCard(card);
        }
        return builder.build();
    }

    public LogList logList() {
        List<Log> logs = logRepository.findAllLog();
        LogList logList = new LogList(logs);
        return logList;
    }

    private Iterable<Card> findAll() {
        return cardRepository.findAll();
    }

    @Transactional
    public void fixCard(Long id, CardDto updateCardDto) {
        Card card = findById(id);
        card.modify(updateCardDto);
        cardRepository.save(card);
    }

    @Transactional
    public void deleteCard(Long id) {
        Card card = findById(id);
        card.delete();
        cardRepository.save(card);
    }

    private Card findById(Long id) {
        return cardRepository.findById(id).orElseThrow(NullPointerException::new);
    }

}
