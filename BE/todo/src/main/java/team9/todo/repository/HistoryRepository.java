package team9.todo.repository;

import org.springframework.data.repository.CrudRepository;
import team9.todo.domain.History;

import java.util.List;

public interface HistoryRepository  extends CrudRepository<History, Long> {
    public List<History> findAllByCard(long card);
}
