package team10.todolist.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import team10.todolist.domain.Log;

import java.util.List;

@Repository
public interface LogRepository extends CrudRepository<Log, Long> {
    List<Log> findAll();
}
