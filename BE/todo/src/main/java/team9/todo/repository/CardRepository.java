package team9.todo.repository;

import org.springframework.data.repository.CrudRepository;
import team9.todo.domain.Card;

import java.util.List;

public interface CardRepository extends CrudRepository<Card, Long> {
    public List<Card> findAllByUserAndColumnType(long user, String columnType);
}
