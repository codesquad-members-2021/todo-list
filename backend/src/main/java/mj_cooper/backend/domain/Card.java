package mj_cooper.backend.domain;

import org.springframework.data.annotation.Id;

public class Card {

    @Id
    private Long cardId;
    private Long category;
    private String title;
    private String contents;
    private double orderNum;

    public Card() {
    }

    public Card(String title) {
        this.title = title;
    }

    public Long getCardId() {
        return cardId;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }

    public Long getCategory() {
        return category;
    }

    public double getOrderNum() {
        return orderNum;
    }

    public void setCardId(Long cardId) {
        this.cardId = cardId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }


    public void setCategory(Long category) {
        this.category = category;
    }

    public void setOrderNum(double orderNum) {
        this.orderNum = orderNum;
    }

    @Override
    public String toString() {
        return "Card{" +
                "cardId=" + cardId +
                ", category=" + category +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", orderNum=" + orderNum +
                '}';
    }
}

