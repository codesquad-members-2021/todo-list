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

@RestController
@RequestMapping("/categories/{categoryPosition}/cards")
public class CardController {
    private final CategoryService categoryService;
    private final CardService cardService;

    public CardController(CategoryService categoryService, CardService cardService) {
        this.categoryService = categoryService;
        this.cardService = cardService;
    }

    @GetMapping
    public String getAllCards(@PathVariable(value = "categoryPosition") final Long categoryPosition) {
        return parseListToJson(categoryService.findCategory(categoryPosition));
    }

    @GetMapping("/{cardPosition}")
    public String getCardById(@PathVariable(value = "categoryPosition") final Long categoryPosition,
                              @PathVariable(value = "cardPosition") final Long cardPosition) {

        Category category = categoryService.findCategory(categoryPosition);
        Card card = category.getCard(cardPosition);
        return parseTodoToJson(card);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public String createCard(@RequestBody Card card,
                             @PathVariable(value = "categoryPosition") final Long categoryPosition) {

        Card foundCard = cardService.addCard(1L, categoryPosition, card);
        return parseTodoToJson(foundCard);
    }

    @PutMapping("/{cardPosition}")
    @ResponseStatus(HttpStatus.OK)
    public String updateCard(@RequestBody final Card card,
                             @PathVariable(value = "categoryPosition") final Long categoryPosition,
                             @PathVariable(value = "cardPosition") final Long cardPosition) {

        Card updatedCard = cardService.updateCard(1L, categoryPosition, cardPosition, card);
        return parseTodoToJson(updatedCard);
    }

    @DeleteMapping("/{cardPosition}")
    @ResponseStatus(HttpStatus.OK)
    public String deleteCard(@PathVariable(value = "categoryPosition") final Long categoryPosition,
                             @PathVariable(value = "cardPosition") final Long cardPosition) {

        cardService.deleteCard(1L, categoryPosition, cardPosition);
        return parseEmptyToJson();
    }

    @PutMapping("/{cardPosition}/move/{moveCategoryPosition}/{moveCardPosition}")
    @ResponseStatus(HttpStatus.OK)
    public String moveTodo(@PathVariable(value = "cardPosition") final Long cardId,
                         @PathVariable(value = "categoryPosition") final Long categoryId,
                         @PathVariable(value = "moveCategoryPosition") final Long moveCategory,
                         @PathVariable(value = "moveCardPosition") final Long index) {

        return parseTodoToJson(cardService.moveCard(1L, cardId, categoryId, moveCategory, index));
    }

    public String parseListToJson(Category category) {
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse(gson.toJson(category.getCards())));

        return gson.toJson(object);
    }

    public String parseTodoToJson(Card card) {
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse(gson.toJson(card)));

        return gson.toJson(object);
    }

    public String parseEmptyToJson() {
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();

        JsonObject object = new JsonObject();
        object.addProperty("status", "success");
        object.add("data", parser.parse("{}"));

        return gson.toJson(object);
    }
}
