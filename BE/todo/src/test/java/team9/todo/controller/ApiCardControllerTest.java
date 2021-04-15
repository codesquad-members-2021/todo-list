package team9.todo.controller;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import team9.todo.domain.Card;
import team9.todo.domain.User;
import team9.todo.domain.enums.CardColumn;
import team9.todo.service.CardService;
import java.util.List;
import static org.assertj.core.api.Assertions.assertThat;
@SpringBootTest
@Transactional
class ApiCardControllerTest {
    private CardService cardService;
    @Autowired
    public ApiCardControllerTest(CardService cardService) {
        this.cardService = cardService;
    }
    private Logger logger = LoggerFactory.getLogger(this.getClass().getName());
    @Test
    @DisplayName("shuffle test")
    void move() {
        User user = new User("test", "1234");
        user.setId(1L);
        for (int i = 0; i < 1000; i++) {
            System.err.println("cycle: "+i);
            shuffleOneCycle(user);
        }
    }
    private void shuffleOneCycle(User user) {
        Card card = cardService.move(3L, 1L, 2L, CardColumn.TODO, user);
        System.err.println("priority: "+card.getPriority());
        List<Card> cards = cardService.getList(CardColumn.TODO, user);
        Assertions.assertAll(
                () -> assertThat(cards.get(0).getId()).isEqualTo(1L),
                () -> assertThat(cards.get(1).getId()).isEqualTo(3L),
                () -> assertThat(cards.get(2).getId()).isEqualTo(2L)
        );
        card = cardService.move(1L, 3L, 2L, CardColumn.TODO, user);
        System.err.println("priority: "+card.getPriority());
        List<Card> cards2 = cardService.getList(CardColumn.TODO, user);
        Assertions.assertAll(
                () -> assertThat(cards2.get(0).getId()).isEqualTo(3L),
                () -> assertThat(cards2.get(1).getId()).isEqualTo(1L),
                () -> assertThat(cards2.get(2).getId()).isEqualTo(2L)
        );
    }
}
