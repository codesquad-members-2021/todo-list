package team_16.todolist.repository;

import org.springframework.data.repository.CrudRepository;
import team_16.todolist.domain.Card;


public interface CardRepository extends CrudRepository<Card, Long> {

}
