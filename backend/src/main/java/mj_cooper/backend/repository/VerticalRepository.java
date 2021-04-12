package mj_cooper.backend.repository;

import mj_cooper.backend.domain.Vertical;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VerticalRepository extends CrudRepository<Vertical, Long> {
}
