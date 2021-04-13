package mj_cooper.backend.repository;

import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Vertical;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
}
