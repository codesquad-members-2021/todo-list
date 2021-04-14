package mj_cooper.backend.service;

import mj_cooper.backend.domain.Card;
import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Category;
import mj_cooper.backend.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;

@Service
public class CardService {
    private final UserRepository userRepository;

    public CardService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Card addTodo(Long userId, Long verticalId, Card card) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new NoSuchElementException("해당 회원이 존재하지 않습니다."));

        Category category = user.getCategory(verticalId);
        category.addTodo(card);
        userRepository.save(user);

        return card;
    }

    public Card updateTodo(Long userId, Long verticalId,
                           Long todoId, Card card) {
        User user = userRepository.findById(userId).get();
        Category category = user.getCategory(verticalId);
        Card foundCard = category.getTodo(todoId);

        foundCard.setTitle(card.getTitle());
        foundCard.setContents(card.getContents());
        foundCard.setCategory(card.getCategory());
        userRepository.save(user);

        return card;
    }

    public void deleteTodo(Long userId, Long verticalId, Long todoId) {
        User user = userRepository.findById(userId).get();
        Category category = user.getCategory(verticalId);
        category.deleteTodo(todoId);

        userRepository.save(user);
    }
}
