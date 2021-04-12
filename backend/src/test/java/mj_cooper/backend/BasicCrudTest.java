package mj_cooper.backend;

import mj_cooper.backend.domain.Todo;
import mj_cooper.backend.domain.Vertical;
import mj_cooper.backend.repository.VerticalRepository;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.assertj.core.api.Assertions.assertThat;

@WebAppConfiguration
@SpringBootTest
public class BasicCrudTest {
    private Todo todo;
    private final static String TITLE = "study 1234";

    @Autowired
    private ApplicationContext ctx;

    @Autowired
    private VerticalRepository verticalRepository;

    @BeforeEach
    void setup() {
    }


    @Test
    @DisplayName("Create Todo")
    void createTodoTest() {
        Vertical vertical = verticalRepository.findById(1L).get();
        vertical.addTodo(new Todo("Study 111"));
        vertical.addTodo(new Todo("Study 123"));
        Vertical savedVertical = verticalRepository.save(vertical);
        assertThat(savedVertical.getId()).isNotNull();
        assertThat(savedVertical.getTodos().get(1)).isNotNull();
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
