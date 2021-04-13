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
        User user = createTestData();
        userRepository.save(user);
    }

    private User createTestData() {
        User user = new User("라쿤오톰", "raccoonAutumn", "1234", "image");

        Column todoColumn = new Column("TODO");
        todoColumn.addTask("title1", "content1");
        todoColumn.addTask("title2", "content2");
        todoColumn.addTask("title3", "content3");
        todoColumn.addTask("title4", "content4");

        Column inProgressColumn = new Column("IN_PROGRESS");
        inProgressColumn.addTask("title5", "content5");
        inProgressColumn.addTask("title6", "content6");

        Column doneColumn = new Column("DONE");
        doneColumn.addTask("title7", "content7");
        Task task = new Task("title8", "content8");
        doneColumn.addTask(task);

        user.addColumn(todoColumn);
        user.addColumn(inProgressColumn);
        user.addColumn(doneColumn);

        user.addTodoLog(TodoLog.buildCreateTodoLog(todoColumn.getColumnTitle(), task.getTaskTitle()));
        user.addTodoLog(TodoLog.buildRemoveTodoLog(todoColumn.getColumnTitle(), task.getTaskTitle()));
        user.addTodoLog(TodoLog.buildCreateTodoLog(todoColumn.getColumnTitle(), task.getTaskTitle()));
        user.addTodoLog(TodoLog.buildMoveTodoLog(doneColumn.getColumnTitle(), todoColumn.getColumnTitle(), task.getTaskTitle()));
        return user;
    }
}
