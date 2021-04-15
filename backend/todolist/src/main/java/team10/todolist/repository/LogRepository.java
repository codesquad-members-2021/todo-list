package team10.todolist.repository;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import team10.todolist.domain.Log;

import java.util.List;

@Repository
public interface LogRepository extends CrudRepository<Log, Long> {

    List<Log> findAll();

    @Query("select * from log order by date_time desc limit :limitRow")
    List<Log> findByDateTimeAndSort(@Param("limitRow") int limitRow);
}
