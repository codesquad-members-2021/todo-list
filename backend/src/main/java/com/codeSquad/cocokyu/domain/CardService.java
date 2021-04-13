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

    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    @Transactional
    public void write(Card card) {
        cardRepository.save(card);
    }

    public CardList sortedList() {
        Iterable<Card> cards = cardRepository.findByCardToNotDeleted();
        CardList cardList = new CardList(cards);
        return cardList;
    }

    public LogList logList() {
        List<Log> logs = cardRepository.findAllLog();
        LogList logList = new LogList(logs);
        return logList;
    }

    private Iterable<Card> findAll() {
        return cardRepository.findAll();
    }

    @Transactional
    public void modify(Long id, CardDto updateCardDto) {
        Card card = findById(id);
        card.modify(updateCardDto);
        cardRepository.save(card);
    }

    @Transactional
    public void delete(Long id) {
        Card card = findById(id);
        card.delete();
        cardRepository.save(card);
    }

    private Card findById(Long id) {
        return cardRepository.findById(id).orElseThrow(NullPointerException::new);
    }

}
