package team10.todolist.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import team10.todolist.domain.Board;

import java.util.List;

@Repository
public interface BoardRepository extends CrudRepository<Board,Long> {
    List<Board> findAll();
    List<Board> findByCategory(String category);
}
