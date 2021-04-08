package team9.todo.repository;

import org.springframework.data.repository.CrudRepository;
import team9.todo.domain.Card;

public interface CardRepository extends CrudRepository<Card, Long> {
}
