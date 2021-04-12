package com.codesquad.todo.web.config;

import com.codesquad.todo.web.domain.Column;
import com.codesquad.todo.web.domain.User;
import com.codesquad.todo.web.domain.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

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
        User user = createUser();
        userRepository.save(user);
    }

    private User createUser() {
        User user = new User("asdf", "asdf", "1234", "image");
        for (Column column : createColumnList()) {
            user.addColumn(column);
        }
        return user;
    }

    private List<Column> createColumnList() {
        List<Column> columnList = new ArrayList<>();
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
        doneColumn.addTask("title8", "content8");

        columnList.add(todoColumn);
        columnList.add(inProgressColumn);
        columnList.add(doneColumn);
        return columnList;
    }
}
