package com.example.todolist.service;

import com.example.todolist.domain.user.User;
import com.example.todolist.domain.user.UserRepository;
import com.example.todolist.exception.ErrorMessage;
import com.example.todolist.exception.UserAccountException;
import com.example.todolist.web.dto.RequestLoginUserDto;
import com.example.todolist.web.dto.RequestSignInUserDto;
import com.example.todolist.web.dto.ResponseLoginUserDto;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void signIn(RequestSignInUserDto requestUserDto) {
        User user = requestUserDto.toEntity();
        if (userRepository.findByUserId(user.getUserId()).isPresent()) {
            throw new UserAccountException(ErrorMessage.DUPLICATED_ID);
        }
        userRepository.save(user);
    }

    public ResponseLoginUserDto login(RequestLoginUserDto userDto) {
        User user = userDto.toEntity();
        User loginUser = userRepository.findByUserIdAndPassword(user.getUserId(), user.getPassword()).orElseThrow(
                () -> new UserAccountException(ErrorMessage.LOGIN_FAILED));
        return new ResponseLoginUserDto(loginUser);
    }

}
