package team9.todo.repository;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import team9.todo.domain.Card;

import java.util.List;
import java.util.Optional;

public interface CardRepository extends CrudRepository<Card, Long> {

    public List<Card> findAllByUserAndColumnTypeAndDeletedFalse(long user, String columnType);

    public Optional<Card> findByIdAndDeletedFalse(Long cardId);

    @Modifying
    @Query("UPDATE `card` SET `deleted` = '1' WHERE (`id` = :cardId)")
    public void softDeleteById(Long cardId);
}
