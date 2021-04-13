package team9.todo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import team9.todo.domain.ApiResult;
import team9.todo.domain.History;
import team9.todo.domain.HistoryWithCardTitle;
import team9.todo.domain.User;
import team9.todo.service.HistoryService;

import javax.servlet.http.HttpSession;
import java.util.List;

import static team9.todo.utils.HttpSessionUtils.getUser;

@RestController
@RequestMapping("/api/histories")
public class ApiHistoryController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final HistoryService historyService;

    @Autowired
    public ApiHistoryController(HistoryService historyService) {
        this.historyService = historyService;
    }

    @GetMapping
    public ApiResult<List<HistoryWithCardTitle>> getHistoryOfUser(HttpSession httpSession) {
        logger.debug("history 목록 요청");
        User user = getUser(httpSession);

        return ApiResult.succeed(historyService.getHistoryOfUser(user));
    }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public ApiResult<History> create(History history) {
        logger.debug("history 생성 요청: {}, {}, {}, {}, {}", history.getAction(), history.getCard(), history.getDate(), history.getFrom(), history.getTo());
        return ApiResult.succeed(historyService.create(history));
    }
}
