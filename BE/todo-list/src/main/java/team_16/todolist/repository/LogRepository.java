package team_16.todolist.repository;

import org.springframework.data.repository.CrudRepository;
import team_16.todolist.domain.Log;

public interface LogRepository extends CrudRepository<Log, Long> {
}
