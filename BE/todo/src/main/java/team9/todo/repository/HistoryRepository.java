package team9.todo.repository;

import org.springframework.data.repository.CrudRepository;
import team9.todo.domain.History;

public interface HistoryRepository extends CrudRepository<History, Long> {
}
