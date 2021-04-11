package com.team13.todolist.model;

import org.assertj.core.api.SoftAssertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
    public void addCardAtAnyPosition() {
        Long prevCardId = 3L;
        Card newCard = Card.of("Spring 공부하기", "토비의 스프링 공부하기").withId(4L);
        reversedCardList.add(1, newCard);
        column.addCard(prevCardId, newCard);
        assertColumnCardList(4);
    }

    @Test
    @DisplayName("Column에 Card를 처음에 추가한다.")
    public void addCardAtFirstPosition() {
        Long prevCardId = 1L;
        Card newCard = Card.of("Database 공부하기", "호눅스 DB 강의").withId(6L);
        reversedCardList.add(newCard);
        column.addCard(prevCardId, newCard);
        assertColumnCardList(4);
    }

    @Test
    @DisplayName("addCard(0L, newCard)는 Card를 리스트의 끝에 추가한다.")
    public void addCardLastPosition() {
        Card newCard = Card.of("알고리즘 공부하기", "프로그래머스 문제 풀기").withId(5L);
        reversedCardList.add(0, newCard);
        column.addCard(0L, newCard);
        assertColumnCardList(4);
    }

    @Test
    @DisplayName("prevId가 Column의 Card 리스트에 존재하지 않는 경우, 예외 발생")
    public void addCardThrowsException() {
        Card newCard = Card.of("알고리즘 공부하기", "프로그래머스 문제 풀기").withId(5L);
        softly.assertThatThrownBy(() -> {
            column.addCard(7L, newCard);
        }).isInstanceOf(RuntimeException.class);
    }

    @Test
    @DisplayName("Column에서 카드를 삭제합니다.")
    public void removeCard() {
        Long cardId = 2L;
        Long prevCardId = 3L;
        reversedCardList.remove(1);
        column.removeCard(cardId, prevCardId);
        assertColumnCardList(2);
    }

    @Test
    @DisplayName("Card List의 끝에 있는 카드를 삭제합니다.")
    public void removeLastCard() {
        Long cardId = 3L;
        Long prevCardId = 0L;
        reversedCardList.remove(0);
        column.removeCard(cardId, prevCardId);
        assertColumnCardList(2);
    }

    @Test
    @DisplayName("Card List의 처음에 있는 카드를 삭제합니다.")
    public void removeFirstCard() {
        Long cardId = 1L;
        Long prevCardId = 2L;
        reversedCardList.remove(2);
        column.removeCard(cardId, prevCardId);
        assertColumnCardList(2);
    }

    @Test
    @DisplayName("Column에 존재하지 않는 카드를 삭제할 경우 Exception 발생")
    public void throwExceptionIfDeletedCardIsNotExist() {
        softly.assertThatThrownBy(() -> {
            column.removeCard(2L, 5L);
        }).isInstanceOf(RuntimeException.class);
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
        Map<Long, CardRef> cards = column.getCards();
        softly.assertThat(cards).hasSize(cardSize);
        while ((cardRef = cards.get(key)) != null) {
            key = reversedCardList.get(index).getId();
            softly.assertThat(cardRef).hasFieldOrPropertyWithValue("card", key);
            index++;
        }
    }

}
