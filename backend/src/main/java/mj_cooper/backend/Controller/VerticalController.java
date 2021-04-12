package mj_cooper.backend.Controller;

import mj_cooper.backend.domain.Vertical;
import mj_cooper.backend.domain.Todo;
import mj_cooper.backend.repository.VerticalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/api/todos")
public class VerticalController {

    @Autowired
    VerticalRepository verticalRepository;

    public VerticalController() {
    }

    @GetMapping
    public List<Todo> getAllTodos() {
        Vertical vertical = verticalRepository.findById(1L).get();

        return vertical.getTodos();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Todo> getTodoById(@PathVariable(value = "id") final Long todoId) {
        Vertical vertical = verticalRepository.findById(1L)
                .orElseThrow(() -> new NoSuchElementException("Todo not available for Id : " + todoId));

        System.out.println("trans to Int int todoId : " + todoId);
        return ResponseEntity.ok().body(vertical.getTodo(todoId));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public void createTodo(@RequestBody Todo todo) {
        Vertical vertical = verticalRepository.findById(1L).get();
        vertical.addTodo(todo);
        verticalRepository.save(vertical);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updateTodo(@PathVariable(value = "id") final Long todoId, @RequestBody final Todo todo){
        Vertical vertical = verticalRepository.findById(1L).get();
        Todo foundTodo = vertical.getTodo(todoId);

        foundTodo.setTitle(todo.getTitle());
        verticalRepository.save(vertical);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteTodo(@PathVariable(value = "id") final Long todoId){
        Vertical vertical = verticalRepository.findById(1L).get();
        vertical.deleteTodo(todoId);
        verticalRepository.save(vertical);
    }
}
