package mj_cooper.backend.service;

import mj_cooper.backend.domain.Card;
import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Category;
import mj_cooper.backend.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;

@Service
public class CardService {
    private static final Logger logger = LoggerFactory.getLogger(CardService.class);
    private final UserRepository userRepository;

    public CardService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Card addCard(Long userId, Long categoryId, Card card) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new NoSuchElementException("해당 회원이 존재하지 않습니다."));

        Category category = user.getCategory(categoryId);

        category.addTodo(card);
        userRepository.save(user);

        // cardId에 매칭되는 orderNum 생성 및 저장
        card.setOrderNum(card.getCardId().doubleValue());
        userRepository.save(user);

        return card;
    }

    public Card updateTodo(Long userId, Long categoryId,
                           Long todoId, Card card) {

        User user = userRepository.findById(userId).get();
        Category category = user.getCategory(categoryId);
        Card foundCard = category.getTodo(todoId);

        foundCard.setTitle(card.getTitle());
        foundCard.setContents(card.getContents());
        foundCard.setCategory(card.getCategory());

        // Category에서 Card의 변경사항을 반영함
        List<Category> categories = user.getCategories();

        List<Card> cards = categories.get(categoryId.intValue() - 1).getTodos();
        cards.remove(0);

        List<Card> cards2 = categories.get(categoryId.intValue() - 2).getTodos();
        cards2.add(0 , foundCard);

        userRepository.save(user);

        return foundCard;
    }

    public void deleteTodo(Long userId, Long categoryId, Long todoId) {
        User user = userRepository.findById(userId).get();
        Category category = user.getCategory(categoryId);
        category.deleteTodo(todoId);

        userRepository.save(user);
    }

    public void moveTodo(Long userId, Long cardId,
                         Long fromCategoryId, Long toCategoryId, Long dropNumber) {
        Long index = dropNumber - 1;
        User user = userRepository.findById(userId).
                orElseThrow(() -> new NoSuchElementException("해당 회원이 존재하지 않습니다."));
        Card movedCard = user.getCategory(fromCategoryId).getTodo(cardId);

        List<Card> fromCards = user.getCategory(fromCategoryId).getTodos();
        List<Card> toCards = user.getCategory(toCategoryId).getTodos();

        fromCards.remove(movedCard);
        movedCard.setCategory(toCategoryId);
        toCards.add(Math.toIntExact(index), movedCard);

        userRepository.save(user);
    }
}
