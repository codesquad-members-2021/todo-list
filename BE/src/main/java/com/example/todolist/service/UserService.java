package com.example.todolist.service;

import com.example.todolist.domain.user.User;
import com.example.todolist.domain.user.UserRepository;
import com.example.todolist.exception.ErrorMessage;
import com.example.todolist.exception.UserAccountException;
import com.example.todolist.web.dto.LoginUserRequestDTO;
import com.example.todolist.web.dto.SignInUserRequestDTO;
import com.example.todolist.web.dto.UserResponseDTO;
import org.springframework.stereotype.Service;

import static com.example.todolist.web.dto.UserResponseDTO.buildResponseUserDto;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public UserResponseDTO signIn(SignInUserRequestDTO requestUserDto) {
        User user = requestUserDto.toEntity();
        if (userRepository.findByUserId(user.getUserId()).isPresent()) {
            throw new UserAccountException(ErrorMessage.DUPLICATED_ID);
        }
        userRepository.save(user);
        return buildResponseUserDto(user);
    }

    public User login(LoginUserRequestDTO userDto) {
        User user = userDto.toEntity();
        return userRepository.findByUserIdAndPassword(user.getUserId(), user.getPassword()).orElseThrow(
                () -> new UserAccountException(ErrorMessage.LOGIN_FAILED));
    }

}
