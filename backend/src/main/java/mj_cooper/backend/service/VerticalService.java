package mj_cooper.backend.service;

import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Vertical;
import mj_cooper.backend.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;

@Service
public class VerticalService {
    private final UserRepository userRepository;

    public VerticalService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Vertical findVertical(Long verticalId) {
        User user = userRepository.findById(1L)
                .orElseThrow(() -> new NoSuchElementException("해당 회원이 존재하지 않습니다."));
        return user.getVertical(verticalId);
    }
}
