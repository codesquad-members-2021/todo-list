package team_16.todolist.domain;

import org.springframework.data.annotation.Id;
import java.time.LocalDateTime;
import java.util.HashSet;
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
        Card card = new Card(title, content, LocalDateTime.now());

        return card;
    }

    public Set<Card> getCards() {
        return cards;
    }

    public void deleteCard(Card card) {
        cards.remove(card);
    }

    public Card updateCard(Long cardId, Card updateCard) {
        for(Card beforeCard : cards) {
            if(beforeCard.getId() == cardId) {
                beforeCard.updateCard(updateCard);
                return beforeCard;
            }
        }
        return null;
    }

    @Override
    public String toString() {
        return "Column{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", cards=" + cards +
                '}';
    }

}
