package team_16.todolist.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import team_16.todolist.domain.Board;


public interface BoardRepository extends CrudRepository<Board, Long> {

}
