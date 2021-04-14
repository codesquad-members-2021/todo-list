package mj_cooper.backend.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import mj_cooper.backend.domain.Todo;
import mj_cooper.backend.domain.Vertical;
import mj_cooper.backend.service.TodoService;
import mj_cooper.backend.service.VerticalService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/verticals/{verticalId}/todos")
public class TodoController {
    private final VerticalService verticalService;
    private final TodoService todoService;

    public TodoController(VerticalService verticalService, TodoService todoService) { //JDBC : TODO 의존성 주입방법 찾아보기
        this.verticalService = verticalService;
        this.todoService = todoService;
    }

    @GetMapping
    public String getAllTodos(@PathVariable(value = "verticalId") final Long verticalId) {
        Vertical vertical = verticalService.findVertical(verticalId);

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
        Vertical vertical = verticalService.findVertical(verticalId);

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
    public String createTodo(@RequestBody Todo todo,
                             @PathVariable(value = "verticalId") final Long verticalId) {
        return todoService.addTodo(1L, verticalId, todo);
    }

    @PutMapping("/{todoId}")
    @ResponseStatus(HttpStatus.OK)
    public void updateTodo(@RequestBody final Todo todo,
                           @PathVariable(value = "verticalId") final Long verticalId,
                           @PathVariable(value = "todoId") final Long todoId) {
        todoService.updateTodo(1L, verticalId, todoId, todo);
    }

    @DeleteMapping("/{todoId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteTodo(@PathVariable(value = "verticalId") final Long verticalId,
                           @PathVariable(value = "todoId") final Long todoId) {
        todoService.deleteTodo(1L, verticalId, todoId);
    }
}
