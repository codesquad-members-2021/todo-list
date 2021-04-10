package com.team13.todolist.model;

import org.assertj.core.api.SoftAssertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

class ColumnTest {

    private SoftAssertions softly;

    private List<Card> reversedCardList;
    private Column column;

    @BeforeEach
    void setUp() {
        softly = new SoftAssertions();
        reversedCardList = new LinkedList<>();
        reversedCardList.add(Card.of("Java 공부하기", "add, commit, push").withId(3L));
        reversedCardList.add(Card.of("GitHub 공부하기", "add, commit, push").withId(2L));
        reversedCardList.add(Card.of("모던 자바스크립트 예제 실습", "1장 예제 내용 실습 후, 커밋까지").withId(1L));
        initColumn();
    }

    @AfterEach
    void afterEach() {
        softly.assertAll();
    }

    @Test
    @DisplayName("Column에 Card를 마지막에 추가한다.")
    public void addCard() {
        assertColumnCardList(3);
    }

    @Test
    @DisplayName("Column에 Card를 임의의 위치에 추가한다.")
    public void addCardWithAnyPosition() {
        Long prevCardId = 3L;
        Card newCard = Card.of("Spring 공부하기", "토비의 스프링 공부하기").withId(4L);
        reversedCardList.add(1, newCard);
        column.addCard(prevCardId, newCard);
        assertColumnCardList(4);
    }

    private void initColumn() {
        column = Column.of("해야할 일", new HashMap<>());
        for (int i = reversedCardList.size() - 1; i >= 0; i--) {
            column.addCard(reversedCardList.get(i));
        }
    }

    private void assertColumnCardList(int cardSize) {
        Long key = 0L;
        CardRef cardRef;
        int index = 0;
        while ((cardRef = column.getCards().get(key)) != null) {
            key = reversedCardList.get(index).getId();
            softly.assertThat(cardRef).hasFieldOrPropertyWithValue("card", key);
            index++;
        }
    }

}
