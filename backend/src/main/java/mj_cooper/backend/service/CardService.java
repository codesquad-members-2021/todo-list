package mj_cooper.backend.service;

import mj_cooper.backend.domain.Card;
import mj_cooper.backend.domain.Category;
import mj_cooper.backend.domain.User;
import mj_cooper.backend.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;

@Service
public class CardService {
    private final UserRepository userRepository;

    public CardService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Card addCard(Long userId, Long categoryId, Card card) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new NoSuchElementException("해당 회원이 존재하지 않습니다."));

        Category category = user.getCategory(categoryId);

        card.updateCategory(categoryId);
        category.addCard(card);

        userRepository.save(user);

        return card;
    }

    public Card updateCard(Long userId, Long categoryId,
                           Long todoId, Card card) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new NoSuchElementException("해당 회원이 존재하지 않습니다."));
        Category category = user.getCategory(categoryId);
        Card foundCard = category.getCard(todoId);

        foundCard.update(card);

        userRepository.save(user);

        return foundCard;
    }

    public void deleteCard(Long userId, Long categoryId, Long todoId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new NoSuchElementException("해당 회원이 존재하지 않습니다."));
        Category category = user.getCategory(categoryId);

        category.deleteCard(todoId);

        userRepository.save(user);
    }

    public Card moveCard(Long userId, Long cardId,
                         Long fromCategoryId, Long toCategoryId, Long dropNumber) {
        long index = dropNumber - 1;
        User user = userRepository.findById(userId).
                orElseThrow(() -> new NoSuchElementException("해당 회원이 존재하지 않습니다."));
        Card movedCard = user.getCategory(fromCategoryId).getCard(cardId);

        List<Card> fromCards = user.getCategory(fromCategoryId).getCards();
        List<Card> toCards = user.getCategory(toCategoryId).getCards();

        fromCards.remove(movedCard);
        movedCard.updateCategory(toCategoryId);
        toCards.add(Math.toIntExact(index), movedCard);

        userRepository.save(user);

        return movedCard;
    }
}
