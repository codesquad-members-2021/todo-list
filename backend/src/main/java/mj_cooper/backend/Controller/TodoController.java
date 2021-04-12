package mj_cooper.backend.Controller;

import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Vertical;
import mj_cooper.backend.domain.Todo;
import mj_cooper.backend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/verticals/{verticalId}/todos")
public class TodoController {

    @Autowired
    UserRepository userRepository;

    public TodoController() {
    }

    @GetMapping
    public List<Todo> getAllTodos(@PathVariable(value = "verticalId") final Long verticalId) {
        User user = userRepository.findById(1L).get();
        Vertical vertical = user.getVertical(verticalId);

        return vertical.getTodos();
    }

    @GetMapping("/{todoId}")
    public ResponseEntity<Todo> getTodoById(@PathVariable(value = "verticalId") final Long verticalId,
                                            @PathVariable(value = "todoId") final Long todoId) {

        User user = userRepository.findById(1L).get();
        Vertical vertical = user.getVertical(verticalId);

        return ResponseEntity.ok().body(vertical.getTodo(todoId));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public void createTodo(@RequestBody Todo todo, @PathVariable(value = "verticalId") final Long verticalId) {

        User user = userRepository.findById(1L).get();
        Vertical vertical = user.getVertical(verticalId);

        vertical.addTodo(todo);

        userRepository.save(user);
    }

    @PutMapping("/{todoId}")
    @ResponseStatus(HttpStatus.OK)
    public void updateTodo(@RequestBody final Todo todo,
                           @PathVariable(value = "verticalId") final Long verticalId,
                           @PathVariable(value = "todoId") final Long todoId) {

        User user = userRepository.findById(1L).get();
        Vertical vertical = user.getVertical(verticalId);
        Todo foundTodo = vertical.getTodo(todoId);

        foundTodo.setTitle(todo.getTitle());

        userRepository.save(user);
    }

    @DeleteMapping("/{todoId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteTodo(@PathVariable(value = "verticalId") final Long verticalId,
                           @PathVariable(value = "todoId") final Long todoId) {

        User user = userRepository.findById(1L).get();
        Vertical vertical = user.getVertical(verticalId);
        vertical.deleteTodo(todoId);

        userRepository.save(user);
    }
}
