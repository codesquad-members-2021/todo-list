package codesquad.TodoList.repository;

import codesquad.TodoList.domain.Card;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CardRepository extends JpaRepository<Card, Long> {
    List<Card> findAllByTodoTrueOrDoingTrueOrDoneTrue();
}
