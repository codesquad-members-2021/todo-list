package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.card.Card;
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
        Iterable<Card> cards = findAll();
        CardList cardList = new CardList(cards);
        return cardList;
    }

    private Iterable<Card> findAll() {
        return cardRepository.findAll();
    }

}
