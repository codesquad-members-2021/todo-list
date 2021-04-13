package com.team13.todolist.repository;

import com.team13.todolist.model.Card;
import com.team13.todolist.model.CardRef;
import com.team13.todolist.model.Column;
import org.assertj.core.api.SoftAssertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.jdbc.DataJdbcTest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@DataJdbcTest
class ColumnRepositoryTest {

    private SoftAssertions softly;

    @Autowired
    private ColumnRepository columnRepository;

    @Autowired
    private CardRepository cardRepository;

    @BeforeEach
    void setUp() {
        softly = new SoftAssertions();
    }

    @AfterEach
    void afterEach() {
        softly.assertAll();
    }

    @Test
    @DisplayName("칼럼에 카드를 마지막에 추가한다.")
    public void addColumn() {
        List<Card> reversedCardList = new ArrayList<>();
        Card card1 = Card.of("모던 자바스크립트 예제 실습", "1장 예제 내용 실습 후, 커밋까지");
        Card card2 = Card.of("GitHub 공부하기", "add, commit, push");
        card1 = cardRepository.save(card1);
        card2 = cardRepository.save(card2);
        reversedCardList.add(card2);
        reversedCardList.add(card1);
        softly.assertThat(cardRepository.findAll()).hasSize(5);

        Column column = Column.of("해야할 일", new HashMap<>());
        column.addCard(card1);
        column.addCard(card2);
        column = columnRepository.save(column);
        softly.assertThat(columnRepository.findAll()).hasSize(4);

        column = columnRepository.findById(column.getId()).orElseThrow(() -> new RuntimeException("Not Found"));

        Long key = 0L;
        CardRef cardRef;
        int index = 0;
        while ((cardRef = column.getCards().get(key)) != null) {
            softly.assertThat(cardRef).hasFieldOrPropertyWithValue("card", reversedCardList.get(index).getId());
            key = cardRef.getCardId();
            index++;
        }

    }

}
