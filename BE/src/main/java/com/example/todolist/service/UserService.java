package com.example.todolist.service;

import com.example.todolist.domain.user.User;
import com.example.todolist.domain.user.UserRepository;
import com.example.todolist.exception.ErrorMessage;
import com.example.todolist.exception.UserAccountException;
import com.example.todolist.web.dto.LoginUserRequestDTO;
import com.example.todolist.web.dto.SignInUserRequestDTO;
import com.example.todolist.web.dto.UserResponseDTO;
import org.springframework.stereotype.Service;

import static com.example.todolist.web.dto.UserResponseDTO.buildUserResponseDTO;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public UserResponseDTO signIn(SignInUserRequestDTO requestUserDTO) {
        User user = requestUserDTO.toEntity();
        if (userRepository.findByUserId(user.getUserId()).isPresent()) {
            throw new UserAccountException(ErrorMessage.DUPLICATED_ID);
        }
        userRepository.save(user);
        return buildUserResponseDTO(user);
    }

    public User login(LoginUserRequestDTO userDTO) {
        User user = userDTO.toEntity();
        return userRepository.findByUserIdAndPassword(user.getUserId(), user.getPassword()).orElseThrow(
                () -> new UserAccountException(ErrorMessage.LOGIN_FAILED));
    }

}
