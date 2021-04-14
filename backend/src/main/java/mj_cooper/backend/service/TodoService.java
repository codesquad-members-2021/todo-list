package mj_cooper.backend.service;

import mj_cooper.backend.domain.Todo;
import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Vertical;
import mj_cooper.backend.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;

@Service
public class TodoService {
    private final UserRepository userRepository;

    public TodoService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Todo addTodo(Long userId, Long verticalId, Todo todo) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new NoSuchElementException("해당 회원이 존재하지 않습니다."));

        Vertical vertical = user.getVertical(verticalId);
        vertical.addTodo(todo);
        userRepository.save(user);

        return todo;
    }

    public Todo updateTodo(Long userId, Long verticalId,
                           Long todoId, Todo todo) {
        User user = userRepository.findById(userId).get();
        Vertical vertical = user.getVertical(verticalId);
        Todo foundTodo = vertical.getTodo(todoId);

        foundTodo.setTitle(todo.getTitle());
        foundTodo.setContents(todo.getContents());
        userRepository.save(user);

        return todo;
    }

    public void deleteTodo(Long userId, Long verticalId, Long todoId) {
        User user = userRepository.findById(userId).get();
        Vertical vertical = user.getVertical(verticalId);
        vertical.deleteTodo(todoId);

        userRepository.save(user);
    }
}
