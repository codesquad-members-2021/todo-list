package team9.todo.repository;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import team9.todo.domain.HistoryWithCardTitle;

import java.util.List;

public interface HistoryWithCardTitleRepository extends CrudRepository<HistoryWithCardTitle, Long> {
    @Query("SELECT `card`.`title` as `card_title`, `history`.`action` as `action`, `history`.`DATE` as `date`, `history`.`from` as `from`, `history`.`to` as `to` FROM `history` " +
            "INNER JOIN `card` ON `history`.`CARD` = `card`.`ID` " +
            "INNER JOIN `user` ON `card`.`USER` = `user`.`ID` AND `user`.`ID` = :userId")  //m :userId는 인자로 들어온 userId가 들어감
    public List<HistoryWithCardTitle> findAllByUserId(Long userId);
}
