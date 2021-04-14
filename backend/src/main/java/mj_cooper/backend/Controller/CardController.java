package mj_cooper.backend.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import mj_cooper.backend.domain.Card;
import mj_cooper.backend.domain.Category;
import mj_cooper.backend.service.CardService;
import mj_cooper.backend.service.CategoryService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/categories/{categoryId}/cards")
public class CardController {
    private final CategoryService categoryService;
    private final CardService cardService;

    public CardController(CategoryService categoryService, CardService cardService) {
        this.categoryService = categoryService;
        this.cardService = cardService;
    }

    @GetMapping
    public String getAllCards(@PathVariable(value = "categoryId") final Long categoryId) {
        return parseListToJson(categoryService.findVertical(categoryId));
    }

    @GetMapping("/{cardId}")
    public String getCardById(@PathVariable(value = "categoryId") final Long categoryId,
                              @PathVariable(value = "cardId") final Long cardId) {

        Category category = categoryService.findVertical(categoryId);
        Card card = category.getTodo(cardId);
        return parseTodoToJson(card);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public String createCard(@RequestBody Card card,
                             @PathVariable(value = "categoryId") final Long categoryId) {

        Card foundCard = cardService.addTodo(1L, categoryId, card);
        return parseTodoToJson(foundCard);
    }

    @PutMapping("/{cardId}")
    @ResponseStatus(HttpStatus.OK)
    public String updateTodo(@RequestBody final Card card,
                           @PathVariable(value = "categoryId") final Long categoryId,
                           @PathVariable(value = "cardId") final Long cardId) {

        Card updatedCard = cardService.updateTodo(1L, categoryId, cardId, card);
        return parseTodoToJson(updatedCard);
    }

    @DeleteMapping("/{cardId}")
    @ResponseStatus(HttpStatus.OK)
    public String deleteTodo(@PathVariable(value = "categoryId") final Long categoryId,
                           @PathVariable(value = "cardId") final Long cardId) {

        cardService.deleteTodo(1L, categoryId, cardId);
        return parseTodoToJson(null);
    }

    public String parseListToJson(Category category) {
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse(gson.toJson(category.getTodos())));

        return gson.toJson(object);
    }

    public String parseTodoToJson(Card card) {
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        Map<String, Card> response = new HashMap<>();
        response.put("card", card);

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse(gson.toJson(response)));

        return gson.toJson(object);
    } //TODO Json 공통부분 generic 배워서 리팩토링 해보기
}
