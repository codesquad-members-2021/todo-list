package team9.todo.repository;

import org.springframework.data.repository.CrudRepository;
import team9.todo.domain.User;

public interface UserRepository extends CrudRepository<User, Long> {
}
