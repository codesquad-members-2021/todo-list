package com.codesquad.todolist;

import com.codesquad.todolist.domain.Card;
import com.codesquad.todolist.repository.CardRepository;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.jdbc.Sql;

@SpringBootTest
public class CardRepositoryTest {

    public Logger logger = LoggerFactory.getLogger(CardRepositoryTest.class);

    @Autowired
    CardRepository cardRepository;

    @Test
    void saveCard() {
        Card card = new Card("Github 공부하기", "commit, push 실습");
        cardRepository.save(card);

        Card firstCard = cardRepository.findById(1L).orElse(null);
        Assertions.assertThat(firstCard.getId()).isEqualTo(card.getId());
    }
}
