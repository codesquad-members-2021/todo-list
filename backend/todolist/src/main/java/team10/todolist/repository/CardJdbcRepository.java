package team10.todolist.repository;

import team10.todolist.domain.Card;

import javax.sql.DataSource;
import java.util.List;
import java.util.Optional;

public class CardJdbcRepository implements CardRepository {

    private final DataSource dataSource;

    public CardJdbcRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public Card save(Card card) {
        return null;
    }

    @Override
    public Optional<Card> findById(Long id) {
        return Optional.empty();
    }

    //@Override
    //public Optional<Card> findByName(String name) {
    //    return Optional.empty();
    //}

    @Override
    public List<Card> findAll() {
        return null;
    }

    @Override
    public <S extends Card> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public boolean existsById(Long aLong) {
        return false;
    }

    @Override
    public Iterable<Card> findAllById(Iterable<Long> longs) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(Long aLong) {

    }

    @Override
    public void delete(Card entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends Card> entities) {

    }

    @Override
    public void deleteAll() {

    }
}
