package team_16.todolist.repository;

import org.springframework.data.repository.CrudRepository;
import team_16.todolist.domain.Log;


import java.util.Set;

public interface LogRepository extends CrudRepository<Log, Long> {
    Set<Log> findAll();
}
