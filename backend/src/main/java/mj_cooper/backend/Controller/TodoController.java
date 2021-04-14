package mj_cooper.backend.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import mj_cooper.backend.domain.Todo;
import mj_cooper.backend.domain.Vertical;
import mj_cooper.backend.service.TodoService;
import mj_cooper.backend.service.VerticalService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/verticals/{verticalId}/todos")
public class TodoController {
    private final VerticalService verticalService;
    private final TodoService todoService;

    public TodoController(VerticalService verticalService, TodoService todoService) {
        this.verticalService = verticalService;
        this.todoService = todoService;
    }

    @GetMapping
    public String getAllTodos(@PathVariable(value = "verticalId") final Long verticalId) {
        return parseListToJson(verticalService.findVertical(verticalId));
    }

    @GetMapping("/{todoId}")
    public String getTodoById(@PathVariable(value = "verticalId") final Long verticalId,
                              @PathVariable(value = "todoId") final Long todoId) {

        Vertical vertical = verticalService.findVertical(verticalId);
        Todo todo = vertical.getTodo(todoId);
        return parseTodoToJson(todo);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public String createTodo(@RequestBody Todo todo,
                             @PathVariable(value = "verticalId") final Long verticalId) {

        Todo foundTodo = todoService.addTodo(1L, verticalId, todo);
        return parseTodoToJson(foundTodo);
    }

    @PutMapping("/{todoId}")
    @ResponseStatus(HttpStatus.OK)
    public String updateTodo(@RequestBody final Todo todo,
                           @PathVariable(value = "verticalId") final Long verticalId,
                           @PathVariable(value = "todoId") final Long todoId) {

        Todo updatedTodo = todoService.updateTodo(1L, verticalId, todoId, todo);
        return parseTodoToJson(updatedTodo);
    }

    @DeleteMapping("/{todoId}")
    @ResponseStatus(HttpStatus.OK)
    public String deleteTodo(@PathVariable(value = "verticalId") final Long verticalId,
                           @PathVariable(value = "todoId") final Long todoId) {

        todoService.deleteTodo(1L, verticalId, todoId);
        return parseTodoToJson(null);
    }

    public String parseListToJson(Vertical vertical) {
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        Map<String, List<Todo>> response = new HashMap<>();
        response.put("todos", vertical.getTodos());

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse(gson.toJson(response)));

        return gson.toJson(object);
    }

    public String parseTodoToJson(Todo todo) {
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        Map<String, Todo> response = new HashMap<>();
        response.put("todo", todo);

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse(gson.toJson(response)));

        return gson.toJson(object);
    } //TODO Json 공통부분 generic 배워서 리팩토링 해보기
}
