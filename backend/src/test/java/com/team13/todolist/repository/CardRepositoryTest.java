package com.team13.todolist.repository;

import com.team13.todolist.model.Card;
import org.assertj.core.api.SoftAssertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.jdbc.DataJdbcTest;

@DataJdbcTest
class CardRepositoryTest {

    private SoftAssertions softly;

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
    void addCard() {
        cardRepository.save(Card.of("스프링 공부", "토비의 스프링"));
        softly.assertThat(cardRepository.findAll()).hasSize(4);
    }

}
