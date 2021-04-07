package team10.todolist.repository;

import org.springframework.data.repository.CrudRepository;
import team10.todolist.domain.Board;

public interface BoardRepository extends CrudRepository<Board,Long> {
}
