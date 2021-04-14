package team_16.todolist.domain;

import org.springframework.data.annotation.Id;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;


public class Board {

    @Id
    private Long id;

    public String title;
    private Set<Card> cards = new HashSet<>();

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCards(Set<Card> cards) {
        this.cards = cards;
    }

    public Board(String title) {
        this.title = title;
    }

    public Card addCard(String title, String content) {
        Card newCard = createCard(title, content);
        cards.add(newCard);

        return newCard;
    }

    private Card createCard(String title, String content) {
        Card card = new Card(title, content);

        return card;
    }

    public Set<Card> getCards() {
        return cards;
    }

    public void deleteCard(Long cardId) {
        getCard(cardId);
        cards.remove(getCard(cardId));
    }

    public Card updateCard(Long cardId, String title, String content) {

        return getCard(cardId).updateCard(title, content);
    }

    public Card getCard(Long cardId) {
        Optional<Card> findCard = null;

        for (Card card : cards) {
            if (card.getId() == cardId) {
                findCard = Optional.of(card);
            }
        }

        return findCard.orElseThrow(IllegalArgumentException::new);
    }

}
