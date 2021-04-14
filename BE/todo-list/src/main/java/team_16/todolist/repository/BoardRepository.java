package team_16.todolist.repository;

import org.springframework.data.repository.CrudRepository;
import team_16.todolist.domain.Board;

import java.util.Set;


public interface BoardRepository extends CrudRepository<Board, Long> {
    Set<Board> findAll();
}
