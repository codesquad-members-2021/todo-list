package team9.todo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import team9.todo.domain.History;
import team9.todo.domain.HistoryWithCardTitle;
import team9.todo.repository.HistoryRepository;
import team9.todo.repository.HistoryWithCardTitleRepository;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/api/histories")
public class ApiHistoryController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final HistoryRepository historyRepository;
    private final HistoryWithCardTitleRepository historyWithCardTitleRepository;

    public ApiHistoryController(HistoryRepository historyRepository, HistoryWithCardTitleRepository historyWithCardTitleRepository) {
        this.historyRepository = historyRepository;
        this.historyWithCardTitleRepository = historyWithCardTitleRepository;
    }

    @Autowired

    @GetMapping
    public List<HistoryWithCardTitle> getHistoryOfUser(HttpSession httpSession){
        Long userId = 1L;
        List<HistoryWithCardTitle> historyList = historyWithCardTitleRepository.findAllByUserId(userId);
        return historyList;
    }

    @GetMapping("/card/{cardId}")
    public List<History>  historyOfCard(@PathVariable long cardId){
        List<History> historyList = historyRepository.findAllByCard(cardId);
        return historyList;
    }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public History create(History history){
        logger.debug("history 생성 요청: {}, {}, {}, {}, {}", history.getAction(), history.getCard(), history.getDate(), history.getFrom(),history.getTo());
        return historyRepository.save(history);
    }

    @DeleteMapping("/{historyId}")
    @ResponseStatus(code = HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long historyId){
        logger.debug("{}번 히스토리 삭제 요청", historyId);
        historyRepository.deleteById(historyId);
    }

}
