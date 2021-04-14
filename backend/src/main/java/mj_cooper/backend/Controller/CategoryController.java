package mj_cooper.backend.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import mj_cooper.backend.domain.Card;
import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Category;
import mj_cooper.backend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    UserRepository userRepository;

    public CategoryController() {
    }

    @GetMapping
    public String getAllVerticals() {
        return parseListToJson(userRepository.findById(1L).get());
    }

    @GetMapping("/{categoryId}")
    public String getTodoById(@PathVariable(value = "categoryId") final Long categoryId) {

        User user = userRepository.findById(1L).get();

        return parseListToJson(user.getCategory(categoryId));
    }

    public String parseListToJson(User user) {
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse(gson.toJson(user.getCategories())));

        return gson.toJson(object);
    }

    public String parseListToJson(Category category) {
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        Map<String, List<Card>> response = new HashMap<>();
        response.put("category", category.getTodos());

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse(gson.toJson(response)));

        return gson.toJson(object);
    }

}
