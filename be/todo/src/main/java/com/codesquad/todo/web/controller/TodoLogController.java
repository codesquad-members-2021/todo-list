package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.TodoLog;
import com.codesquad.todo.web.domain.User;
import com.codesquad.todo.web.service.dto.TodoLogDto;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/logs")
public class TodoLogController {

    @GetMapping
    public List<TodoLogDto> showTodoLogList() {
        List<TodoLogDto> todoLogList = new ArrayList<>();

        User author = new User(1, "라쿠운", "Racoon", "1234", "");
        todoLogList.add(new TodoLogDto(new TodoLog(1, "'move' '1 자바스크립트 예제 실습 수정됨!' 'TODO' 'IN_PROGRESS'", author)));
        todoLogList.add(new TodoLogDto(new TodoLog(2, "'move' '2 자바스크립트 예제 실습 수정됨!' 'TODO' 'IN_PROGRESS'", author)));

        return todoLogList;
    }
}
