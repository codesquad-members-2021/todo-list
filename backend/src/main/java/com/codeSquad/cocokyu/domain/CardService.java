package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.card.Card;
import com.codeSquad.cocokyu.domain.card.Status;
import org.springframework.stereotype.Service;


@Service
public class CardService {

    private final CardRepository cardRepository;

    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    public void write(Card card){
        cardRepository.save(card);
    }

    public CardList sortedList() {
        Iterable<Card> cards = cardRepository.findByCardToNotDeleted();
        CardList cardList = new CardList(cards);
        return cardList;
    }

    private Iterable<Card> findAll() {
        return cardRepository.findAll();
    }

    public void modify(Long id, Card updateCard) {
        Card card = findById(id);
        card.modify(updateCard);
        cardRepository.save(card);
;    }

    public void delete(Long id) {
        Card card = findById(id);
        card.changeStatus(Status.DELETED);
        cardRepository.save(card);
    }

    private Card findById(Long id){
        return cardRepository.findById(id).orElseThrow(NullPointerException::new);
    }
}
