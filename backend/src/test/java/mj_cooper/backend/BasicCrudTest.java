package mj_cooper.backend;

import mj_cooper.backend.domain.Card;
import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Category;
import mj_cooper.backend.repository.UserRepository;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.assertj.core.api.Assertions.assertThat;

@WebAppConfiguration
@SpringBootTest
public class BasicCrudTest {
    private Card card;
    private final static String TITLE = "study 1234";

    @Autowired
    private ApplicationContext ctx;

    @Autowired
    private UserRepository userRepository;

    @BeforeEach
    void setup() {
    }

    @Test
    @DisplayName("Create Todo")
    void createTodoTest() {
        User user = userRepository.findById(1L).get();
        Category category = user.getCategory(1L);

        category.addTodo(new Card("Study 111"));
        category.addTodo(new Card("Study 123"));

        User savedUser = userRepository.save(user);
        assertThat(savedUser.getId()).isNotNull();
        assertThat(savedUser.getCategories().get(1)).isNotNull();
    }

//    @Test
//    @DisplayName("Update & Read Todo")
//    void updateTodoTest() {
//        todo.setTitle(TITLE);
//        Todo updatedTodo = columnRepository.save(todo);
//
//        assertThat(updatedTodo.getTitle()).isEqualTo(TITLE);
//        assertThat(updatedTodo.getId()).isEqualTo(todo.getId());
//    }
//
//    @Test
//    @DisplayName("Delete Todo")
//    void deleteTodoTest() {
//        // TODO: 어떻게 테스트 할까?
//        columnRepository.delete(todo);
//    }
}
