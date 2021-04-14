package mj_cooper.backend.Controller;

import com.google.gson.*;
import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Vertical;
import mj_cooper.backend.domain.Todo;
import mj_cooper.backend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/verticals/{verticalId}/todos")
public class TodoController {

    @Autowired
    UserRepository userRepository;

    public TodoController() {
    }

    @GetMapping
    public String getAllTodos(@PathVariable(value = "verticalId") final Long verticalId) {
        User user = userRepository.findById(1L).get();
        Vertical vertical = user.getVertical(verticalId);

        // Json 변환 로직
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        Map<String, List<Todo>> response = new HashMap<>();
        response.put("todos", vertical.getTodos());

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse(gson.toJson(response)));

        return gson.toJson(object);
    }

    @GetMapping("/{todoId}")
    public ResponseEntity<String> getTodoById(@PathVariable(value = "verticalId") final Long verticalId,
                                            @PathVariable(value = "todoId") final Long todoId) {

        User user = userRepository.findById(1L).get();
        Vertical vertical = user.getVertical(verticalId);

        // Json 변환 로직
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        Map<String, Todo> response = new HashMap<>();
        response.put("todo", vertical.getTodo(todoId));

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse(gson.toJson(response)));

        return ResponseEntity.ok().body(gson.toJson(object));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public String createTodo(@RequestBody Todo todo, @PathVariable(value = "verticalId") final Long verticalId) {

        User user = userRepository.findById(1L).get();
        Vertical vertical = user.getVertical(verticalId);

        vertical.addTodo(todo);

        return userRepository.save(user).toString();

//        // Json 변환 로직
//        Gson gson = new Gson();
//        JsonParser parser = new JsonParser();
//
//        Map<String, Todo> response = new HashMap<>();
//        response.put("todo", vertical.getTodo(todo));
//
//        JsonObject object = new JsonObject();
//        object.addProperty("status", "success");
//        object.add("data", parser.parse(gson.toJson(response)));
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
