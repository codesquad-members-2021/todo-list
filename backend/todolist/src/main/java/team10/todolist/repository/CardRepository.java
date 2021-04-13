package team10.todolist.repository;

import org.springframework.data.repository.CrudRepository;
import team10.todolist.domain.Card;

<<<<<<< HEAD
=======
import javax.sql.DataSource;
>>>>>>> f70f1ed58c83fcabe2142e83825ab4adee882d4e
import java.util.List;
import java.util.Optional;

public interface CardRepository extends CrudRepository<Card,Long> {


    Card save(Card card);
    Optional<Card> findById(Long id);
    //Optional<Card> findByName(String name);
    List<Card> findAll();
}
