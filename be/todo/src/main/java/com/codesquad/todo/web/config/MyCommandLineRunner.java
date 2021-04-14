package com.codesquad.todo.web.config;

import com.codesquad.todo.web.domain.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class MyCommandLineRunner implements CommandLineRunner {
    private static final Logger logger = LoggerFactory.getLogger(MyCommandLineRunner.class);
    private final UserRepository userRepository;

    public MyCommandLineRunner(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public void run(String... args) {
        logger.debug("MyCommandLineRunner called!");
        createUser();
    }

    private void createUser() {
        TodoUser todoUser = createTestData();
        userRepository.save(todoUser);
    }

    private TodoUser createTestData() {
        TodoUser todoUser = new TodoUser("라쿤오톰", "raccoonAutumn", "1234", "image");

        TodoColumn todoColumn = new TodoColumn("TODO");
        todoColumn.addTask("title1", "content1");
        todoColumn.addTask("title2", "content2");
        todoColumn.addTask("title3", "content3");
        todoColumn.addTask("title4", "content4");

        TodoColumn inProgressTodoColumn = new TodoColumn("IN_PROGRESS");
        inProgressTodoColumn.addTask("title5", "content5");
        inProgressTodoColumn.addTask("title6", "content6");

        TodoColumn doneTodoColumn = new TodoColumn("DONE");
        doneTodoColumn.addTask("title7", "content7");
        TodoTask todoTask = new TodoTask("title8", "content8");
        doneTodoColumn.addTask(todoTask);

        todoUser.addColumn(todoColumn);
        todoUser.addColumn(inProgressTodoColumn);
        todoUser.addColumn(doneTodoColumn);

        todoUser.addTodoLog(TodoLog.buildCreateTodoLog(todoColumn.getColumnTitle(), todoTask.getTaskTitle()));
        todoUser.addTodoLog(TodoLog.buildRemoveTodoLog(todoColumn.getColumnTitle(), todoTask.getTaskTitle()));
        todoUser.addTodoLog(TodoLog.buildCreateTodoLog(todoColumn.getColumnTitle(), todoTask.getTaskTitle()));
        todoUser.addTodoLog(TodoLog.buildMoveTodoLog(doneTodoColumn.getColumnTitle(), todoColumn.getColumnTitle(), todoTask.getTaskTitle()));
        return todoUser;
    }
}
