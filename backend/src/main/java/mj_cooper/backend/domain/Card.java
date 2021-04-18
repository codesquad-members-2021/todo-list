package mj_cooper.backend.domain;

import org.springframework.data.annotation.Id;

public class Card {

    @Id
    private Long cardId;
    private Long category;
    private String title;
    private String contents;

    public Card() {
    }

    public Card(String title) {
        this.title = title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }


    public void updateCategory(Long category) {
        this.category = category;
    }

    public void update(Card card) {
        this.title = card.title;
        this.contents = card.contents;
        this.category = card.category;
    }

    @Override
    public String toString() {
        return "Card{" +
                "cardId=" + cardId +
                ", category=" + category +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                '}';
    }
}

