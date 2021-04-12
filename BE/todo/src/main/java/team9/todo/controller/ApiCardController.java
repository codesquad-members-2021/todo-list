package team9.todo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import team9.todo.domain.Card;
import team9.todo.repository.CardRepository;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/api/cards")
public class ApiCardController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final CardRepository cardRepository;

    @Autowired
    public ApiCardController(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public Card create(Card card, HttpSession httpSession) {
        logger.debug("card 생성 요청: {}, {}, {}", card.getColumnType(), card.getTitle(), card.getContent());
        card.setUser(1);
        return cardRepository.save(card);
    }

    @GetMapping("/{column}")
    public List<Card> getList(@PathVariable int column, HttpSession httpSession) {
        logger.debug("{}의 카드 목록 요청", column);
        String str = "";
        switch (column){  //M 숫자로 인식이돼서 잠시 스위치문으로 바꿈, 문자열주소인경우 퍼센트 인코딩도 고려해봐야할 거 같음
            case 1:
                str = "할일";
                break;
            case 2:
                str = "하는중";
                break;
            case 3:
                str = "완료";
                break;
        }

        return cardRepository.findAllByUserAndColumnType(1, str);
    }

    @PutMapping("/{columnId}") //TODO. 어떤 컬럼의 몇번째 카드에 대한 정보를 받아야할 것 같음. 아니면 그냥 모든 카드 번호로 탐색?
    public Card update(@PathVariable long columnId, Card card, HttpSession httpSession) {
        logger.debug("{}번 카드의 내용 수정 요청", columnId);
        Card toUpdate = cardRepository.findById(columnId).get();
        toUpdate.update(card);
        return cardRepository.save(toUpdate);
    }

    @DeleteMapping("/{columnId}")
    @ResponseStatus(code = HttpStatus.NO_CONTENT)
    public void delete(@PathVariable long columnId, HttpSession httpSession) {
        logger.debug("{}번 카드의 삭제 요청", columnId);
        cardRepository.deleteById(columnId);
    }
}
