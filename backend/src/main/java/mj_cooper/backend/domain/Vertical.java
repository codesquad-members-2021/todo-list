package mj_cooper.backend.domain;

import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

public class Vertical {

    @Id
    private Long id;
    private String status;
    private List<Todo> todos = new ArrayList<>();

    public Vertical() {
    }

    public Long getId() {
        return id;
    }

    public String getStatus() {
        return status;
    }

    public List<Todo> getTodos() {
        return todos;
    }

    public Todo getTodo(Long id) {
        return todos.get(Math.toIntExact(id) - 1);
    }

    public void deleteTodo(Long id) {
        todos.remove(todos.get(Math.toIntExact(id) - 1));
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean addTodo(Todo todo) {
        return this.todos.add(todo);
    }
//
//    public void update(Vertical vertical) {
//        this.todos = vertical.getTodos();
//    }
//
    @Override
    public String toString() {
        return "Vertical{" +
                "id=" + id +
                ", todos=" + todos +
                '}';
    }
}

