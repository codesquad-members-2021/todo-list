package team_16.todolist.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import team_16.todolist.domain.Log;

@Repository
public interface LogRepository extends CrudRepository<Log, Long> {
}
