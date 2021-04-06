package com.team13.todolist.repository;

import com.team13.todolist.model.Card;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.jdbc.DataJdbcTest;

import static org.assertj.core.api.Assertions.assertThat;

@DataJdbcTest
class CardRepositoryTest {

    @Autowired
    private CardRepository cardRepository;

    @Test
    public void contextLoads() {
        assertThat(cardRepository).isNotNull();
    }

    @Test
    public void getCardTest() {
        for (Card card : cardRepository.findAll()) {
            System.out.println(card);
            assertThat(card).hasNoNullFieldsOrProperties();
            assertThat(card).isNotNull();
        }
    }
}
