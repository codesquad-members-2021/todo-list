package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.exceptions.UserNotFoundException;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.jdbc.DataJdbcTest;

@DataJdbcTest
class UserRepositoryTest {

    private static final Logger logger = LoggerFactory.getLogger(UserRepositoryTest.class);

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ColumnRepository columnRepository;

    @Test
    @DisplayName("어그리게이션 루트인 유저에 컬럼을 추가할 수 있어야 합니다")
    void testColumnCreation() {
        createColumns(createUser());
        Iterable<Column> columnList = columnRepository.findAll();
        columnList.forEach((column -> logger.info("column : {}", column)));
    }


    private User createUser() {
        User user = new User("asdf", "asdf", "1234", "image");
        return userRepository.save(user);
    }

    private User createColumns(User user) {
        user.addColumn("TODO");
        user.addColumn("IN_PROGRESS");
        user.addColumn("DONE");
        userRepository.save(user);
        return user;
    }

    @Test
    @DisplayName("태스크를 생성해서 컬럼에 추가할 수 있어야 합니다")
    void testTaskCreation() {
        User user = createUserAndInitColumn();
        user = userRepository.findById(user.getId()).orElseThrow(UserNotFoundException::new);
        user.getColumnList().forEach((column -> logger.info("column : {}", column)));
    }

    private User createUserAndInitColumn() {
        User user = createUser();

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

        user.addColumn(todoColumn);
        user.addColumn(inProgressColumn);
        user.addColumn(doneColumn);

        return userRepository.save(user);
    }


    @Test
    @DisplayName("컬럼 내부에서 태스크를 옮길 수 있어야 합니다")
    void testMoveTaskInSameColumn() {
        User user = createUserAndInitColumn();
        user = userRepository.findById(user.getId()).orElseThrow(UserNotFoundException::new);
        Long prevColumnId = user.getColumnList().get(0).getId();
        Long nextColumnId = user.getColumnList().get(2).getId();
        Long taskId = user.getColumnList().get(0).getTaskList().get(0).getId();
        int newTaskPosition = 0;
        user.moveTask(prevColumnId, nextColumnId, taskId, newTaskPosition);
        userRepository.save(user);

        user = userRepository.findById(user.getId()).orElseThrow(UserNotFoundException::new);
        logger.debug("{}", user);
    }
}
