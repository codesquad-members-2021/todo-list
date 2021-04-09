package mj_cooper.backend.Controller;

import mj_cooper.backend.domain.Todo;
import mj_cooper.backend.repository.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/api/todos")
public class TodoController {

    @Autowired
    TodoRepository todoRepository;

    public TodoController() {

    }

    @GetMapping
    public List<Todo> getAllTodos() {
        return (List<Todo>) todoRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Todo> getTodoById(@PathVariable(value = "id") final Long todoId){
        Todo todo = todoRepository.findById(todoId)
                .orElseThrow(() -> new NoSuchElementException("Todo not available for Id : " + todoId));

        return ResponseEntity.ok().body(todo);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public void createTodo(@RequestBody Todo todo){
        todoRepository.save(todo);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updateTodo(@PathVariable(value = "id") final Long todoId, @RequestBody final Todo todo){
        Todo foundTodo = todoRepository.findById(todoId)
                .orElseThrow( () -> new NoSuchElementException("Todo not available for Id : " + todoId));

        foundTodo.setTitle(todo.getTitle());
        todoRepository.save(foundTodo);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteTodo(@PathVariable(value = "id") final Long todoId){
        Todo todo = todoRepository.findById(todoId)
                .orElseThrow( () -> new NoSuchElementException("Todo not available for Id : " + todoId));

        todoRepository.delete(todo);
    }
}
