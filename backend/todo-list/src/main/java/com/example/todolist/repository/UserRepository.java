package com.example.todolist.repository;

import com.example.todolist.domain.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User,Long> {
    User findByToken(String token);
}
