package mj_cooper.backend.domain;

import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

public class User {

    @Id
    private Long id;
    private String name;
    private List<Vertical> verticals = new ArrayList<>();

    public User() {
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public List<Vertical> getVerticals() {
        return verticals;
    }

    public Vertical getVertical(Long id) {
        return verticals.get(Math.toIntExact(id) - 1);
    }

    public boolean addVertical(Vertical vertical){
        return verticals.add(vertical);
    }
}
