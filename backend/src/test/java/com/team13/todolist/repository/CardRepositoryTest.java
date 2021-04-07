package com.team13.todolist.repository;

import com.team13.todolist.model.Card;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.jdbc.DataJdbcTest;

import static org.assertj.core.api.Assertions.assertThat;

@DataJdbcTest
class CardRepositoryTest {

    private final Logger log = LoggerFactory.getLogger(CardRepositoryTest.class);

    @Autowired
    private CardRepository cardRepository;

    @Test
    @DisplayName("context에서 cardRepository 읽기")
    public void contextLoads() {
        assertThat(cardRepository).isNotNull();
    }

    @Test
    @DisplayName("모든 카드(4개)를 가져옵니다")
    public void getCardTest() {
        assertThat(cardRepository.findAll()).hasSize(4);
        for (Card card : cardRepository.findAll()) {
            assertThat(card).hasNoNullFieldsOrProperties();
            assertThat(card).isNotNull();
        }
    }

    @Test
    @DisplayName("카드를 저장하고, 가져와서 값을 확인합니다.")
    public void addCardTest() {
        Card card = Card.create("Spring 공부", "토비의 스프링 공부", 1L);
        card = cardRepository.save(card);
        card = cardRepository.findById(card.getId()).orElseThrow(() -> new RuntimeException("Not Found"));
        cardPropertyAssert(card, "Spring 공부", "토비의 스프링 공부", 1L);
        assertThat(cardRepository.findAll()).hasSize(5);
    }

    @Test
    @DisplayName("다른 카드를 저장합니다. 다른 테스트와 독립적인지 확인")
    public void addAnotherCardTest() {
        Card card = Card.create("DB 공부", "호눅스의 DB 공부", 1L);
        cardRepository.save(card);
        assertThat(cardRepository.findAll()).hasSize(5);
    }

    @Test
    @DisplayName("카드를 삭제합니다.")
    public void deleteCardTest() {
        Card card = cardRepository.findById(1L).orElseThrow(() -> new RuntimeException("Not Found"));
        cardRepository.delete(card);
        assertThat(cardRepository.findAll()).hasSize(3);
    }

    @Test
    @DisplayName("카드 정보 업데이트 (JPA Merge 방법)")
    public void updateCardMerge() {
        Card card = Card.create("DB 공부", "호눅스의 DB 공부", 1L);
        card = cardRepository.save(card);

        Card updateCardInfo = Card.create(card.getId(), "AWS 공부", "호눅스 AWS 강의 듣기", 1L);
        cardRepository.save(updateCardInfo);

        Card updatedCard = cardRepository.findById(card.getId()).orElseThrow(() -> new RuntimeException("Not Found"));
        cardPropertyAssert(updatedCard, "AWS 공부", "호눅스 AWS 강의 듣기", 1L);
        assertThat(cardRepository.findAll()).hasSize(5);
    }

    @Test
    @DisplayName("카드 정보 업데이트(Card.update)")
    public void updateCardByMethod() {
        Card card = Card.create("DB 공부", "호눅스의 DB 공부", 1L);
        card = cardRepository.save(card);

        Card updateCardInfo = Card.create("AWS 공부", "호눅스 AWS 강의 듣기", 1L);
        card = cardRepository.findById(card.getId()).orElseThrow(() -> new RuntimeException("Not Found"));
        card.update(updateCardInfo);
        card = cardRepository.save(card);

        Card updatedCard = cardRepository.findById(card.getId()).orElseThrow(() -> new RuntimeException("Not Found"));
        cardPropertyAssert(updatedCard, "AWS 공부", "호눅스 AWS 강의 듣기", 1L);
        assertThat(cardRepository.findAll()).hasSize(5);
    }

    private void cardPropertyAssert(Card card, String title, String body, Long columnId) {
        assertThat(card).hasFieldOrPropertyWithValue("title", title);
        assertThat(card).hasFieldOrPropertyWithValue("body", body);
        assertThat(card).hasFieldOrPropertyWithValue("columnId", columnId);
    }
}
