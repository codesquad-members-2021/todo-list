package mj_cooper.backend.domain;

import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

public class User {

    @Id
    private Long id;
    private String name;
    private List<Category> categories = new ArrayList<>();

    public User() {
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public Category getCategory(Long id) {
        return categories.get(Math.toIntExact(id) - 1);
    }

    public boolean addCategory(Category category){
        return categories.add(category);
    }
}
