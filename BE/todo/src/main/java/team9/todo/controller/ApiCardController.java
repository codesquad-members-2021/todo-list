package team9.todo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import team9.todo.domain.ApiResult;
import team9.todo.domain.Card;
import team9.todo.domain.DTO.Card.RequestMoveDTO;
import team9.todo.domain.DTO.Card.RequestUpdateDTO;
import team9.todo.domain.User;
import team9.todo.domain.enums.CardColumn;
import team9.todo.service.CardService;

import javax.servlet.http.HttpSession;
import java.util.List;

import static team9.todo.utils.HttpSessionUtils.getUser;

@RestController
@RequestMapping("/api/cards")
public class ApiCardController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final CardService cardService;

    @Autowired
    public ApiCardController(CardService cardService) {
        this.cardService = cardService;
    }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public ApiResult<Card> create(@RequestBody Card card, HttpSession httpSession) {
        logger.debug("card 생성 요청: {}, {}, {}", card.getColumnType(), card.getTitle(), card.getContent());
        User user = getUser(httpSession);
        card.setUser(user.getId());

        return ApiResult.succeed(cardService.create(card, user));
    }

    @GetMapping("/todo")
    public ApiResult<List<Card>> getTodo(HttpSession httpSession) {
        logger.debug("{}의 카드 목록 요청", CardColumn.TODO.name());
        User user = getUser(httpSession);

        return ApiResult.succeed(cardService.getList(CardColumn.TODO, user));
    }

    @GetMapping("/doing")
    public ApiResult<List<Card>> getDoing(HttpSession httpSession) {
        logger.debug("{}의 카드 목록 요청", CardColumn.DOING.name());
        User user = getUser(httpSession);

        return ApiResult.succeed(cardService.getList(CardColumn.DOING, user));
    }

    @GetMapping("/done")
    public ApiResult<List<Card>> getDone(HttpSession httpSession) {
        logger.debug("{}의 카드 목록 요청", CardColumn.DONE.name());
        User user = getUser(httpSession);

        return ApiResult.succeed(cardService.getList(CardColumn.DONE, user));
    }

    @PutMapping("/{cardId}")
    public ApiResult<Card> update(@PathVariable long cardId, @RequestBody RequestUpdateDTO requestUpdateDTO, HttpSession httpSession) {
        logger.debug("{}번 카드의 내용 수정 요청", cardId);
        User user = getUser(httpSession);

        return ApiResult.succeed(cardService.update(cardId, requestUpdateDTO.getTitle(), requestUpdateDTO.getContent(), user));
    }

    @PutMapping("/move/{cardId}")
    public ApiResult<Card> move(@PathVariable long cardId, @RequestBody RequestMoveDTO requestMoveDTO, HttpSession httpSession) {
        User user = getUser(httpSession);

        return ApiResult.succeed(cardService.move(cardId, requestMoveDTO.getPrevCardId(), requestMoveDTO.getNextCardId(), user));
    }


    @DeleteMapping("/{cardId}")
    @ResponseStatus(code = HttpStatus.NO_CONTENT)
    public void delete(@PathVariable long cardId, HttpSession httpSession) {
        logger.debug("{}번 카드의 삭제 요청", cardId);
        User user = getUser(httpSession);

        cardService.delete(cardId, user);
    }
}
