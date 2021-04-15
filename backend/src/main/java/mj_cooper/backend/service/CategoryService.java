package mj_cooper.backend.service;

import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Category;
import mj_cooper.backend.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;

@Service
public class CategoryService {
    private final UserRepository userRepository;

    public CategoryService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Category findCategory(Long categoryId) {
        User user = userRepository.findById(1L)
                .orElseThrow(() -> new NoSuchElementException("해당 회원이 존재하지 않습니다."));
        return user.getCategory(categoryId);
    }
}
