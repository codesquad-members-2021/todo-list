package team_16.todolist.repository;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import team_16.todolist.domain.Board;


@Repository
public interface BoardRepository extends CrudRepository<Board, Long> {

}
