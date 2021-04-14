package team9.todo.repository;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import team9.todo.domain.Card;
import team9.todo.domain.enums.CardColumn;

import java.util.List;
import java.util.Optional;

public interface CardRepository extends CrudRepository<Card, Long> {

    public List<Card> findAllByUserAndColumnTypeAndDeletedFalseOrderByPriority(long user, String columnType);

    public Optional<Card> findByIdAndDeletedFalse(Long cardId);

    @Modifying
    @Query("UPDATE `card` SET `deleted` = '1' WHERE (`id` = :cardId)")
    public void softDeleteById(Long cardId);

    @Query("SELECT `priority` FROM `card` " +
            "WHERE `user` = :user AND `column_type` = :cardColumn AND `deleted` = 0 " +
            "ORDER BY `priority` desc limit 1")
    public Optional<Double> findMaxPriority(Long user, CardColumn cardColumn);
}
