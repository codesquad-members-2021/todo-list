package mj_cooper.backend;

import mj_cooper.backend.domain.Todo;
import mj_cooper.backend.repository.TodoRepository;
import org.junit.jupiter.api.*;
import org.junit.platform.commons.logging.Logger;
import org.junit.platform.commons.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
public class BasicCrudTest {
    private Todo todo;
    private final static String TITLE = "study 1234";

    @BeforeEach
    void setup() {
        todo = todoRepository.save(new Todo("study 11", LocalDateTime.now()));
    }

    @Autowired
    private TodoRepository todoRepository;

    @Test
    @DisplayName("Create Todo")
    void createTodoTest() {
        assertThat(todo).isNotNull();
        assertThat(todo.getId()).isNotNull();
    }

    @Test
    @DisplayName("Update & Read Todo")
    void updateTodoTest() {
        todo.setTitle(TITLE);
        Todo updatedTodo = todoRepository.save(todo);

        assertThat(updatedTodo.getTitle()).isEqualTo(TITLE);
        assertThat(updatedTodo.getId()).isEqualTo(todo.getId());
    }

    @Test
    @DisplayName("Delete Todo")
    void deleteTodoTest() {
        // TODO: 어떻게 테스트 할까?
        todoRepository.delete(todo);
    }
}
