package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.exceptions.ColumnNotFoundException;
import com.codesquad.todo.web.exceptions.TaskNotFoundException;
import com.codesquad.todo.web.exceptions.UserNotFoundException;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.jdbc.DataJdbcTest;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@DataJdbcTest
class UserRepositoryTest {

    private static final Logger logger = LoggerFactory.getLogger(UserRepositoryTest.class);

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ColumnRepository columnRepository;

    @Autowired
    private TaskRepository taskRepository;

    @Test
    @DisplayName("어그리게이션 루트인 유저에 컬럼을 추가할 수 있어야 합니다")
    void testColumnCreation() {
        createColumns(createUser());
        List<Column> columnList = columnRepository.findAll();
        List<Column> expectedColumnList = new ArrayList<>();
        expectedColumnList.add(new Column("TODO"));
        expectedColumnList.add(new Column("IN_PROGRESS"));
        expectedColumnList.add(new Column("DONE"));

        assertThat(columnList.size()).isEqualTo(expectedColumnList.size());
        for (int i = 0; i < columnList.size(); i++) {
            assertThat(columnList.get(i).isSameTitle(expectedColumnList.get(i))).isTrue();
        }
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

        List<Column> columnList = user.getColumnList();
        List<Column> expectedColumnList = createColumnList();

        assertThat(columnList.size()).isEqualTo(expectedColumnList.size());
        for (int i = 0; i < columnList.size(); i++) {
            Column currentColumn = columnList.get(i);
            Column expectedCurrentColumn = expectedColumnList.get(i);
            assertThat(currentColumn.isSameTitle(expectedCurrentColumn)).isTrue();

            assertThat(currentColumn.sizeOfTaskList()).isEqualTo(expectedCurrentColumn.sizeOfTaskList());
            for (int j = 0; j < currentColumn.sizeOfTaskList(); j++) {
                Task currentTask = currentColumn.getTaskList().get(j);
                Task expectedCurrentTask = expectedCurrentColumn.getTaskList().get(j);

                assertThat(currentTask.isSameTitle(expectedCurrentTask)).isTrue();
            }
        }
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

    private User createUserAndInitColumn() {
        User user = createUser();
        List<Column> columnList = createColumnList();
        for (Column column : columnList) {
            user.addColumn(column);
        }
        userRepository.save(user);
        return userRepository.findById(user.getId()).orElseThrow(UserNotFoundException::new);
    }


    @Test
    @DisplayName("컬럼 내부에서 태스크를 옮길 수 있어야 합니다")
    void testMoveTaskInSameColumn() {
        User user = createUserAndInitColumn();
        Long prevColumnId = user.getColumnList().get(0).getId();
        Long nextColumnId = user.getColumnList().get(2).getId();
        Long taskId = user.getColumnList().get(0).getTaskList().get(0).getId();
        int newTaskPosition = 0;
        user.moveTask(prevColumnId, nextColumnId, taskId, newTaskPosition);
        userRepository.save(user);

        user = userRepository.findById(user.getId()).orElseThrow(UserNotFoundException::new);

        assertThat(user.getColumnList().get(2).getTaskList().get(0).isSameId(taskId)).isTrue();
    }

    @Test
    @DisplayName("컬럼 내부에서 태스크를 옮길 수 있어야 합니다 II")
    void testMoveTaskInSameColumnII() {
        User user = createUserAndInitColumn();
        Long prevColumnId = user.getColumnList().get(0).getId();
        Long nextColumnId = user.getColumnList().get(2).getId();
        Long taskId = user.getColumnList().get(0).getTaskList().get(0).getId();
        int newTaskPosition = 2;
        user.moveTask(prevColumnId, nextColumnId, taskId, newTaskPosition);
        userRepository.save(user);

        user = userRepository.findById(user.getId()).orElseThrow(UserNotFoundException::new);

        assertThat(user.getColumnList().get(2).getTaskList().get(2).isSameId(taskId)).isTrue();
    }

    @Test
    @DisplayName("컬럼에서 태스크를 지울 수 있어야 합니다")
    void testRemoveTaskById() {
        User user = createUserAndInitColumn();

        Long columnId = user.getColumnList().get(0).getId();
        Long taskId = user.getColumnList().get(0).getTaskList().get(0).getId();

        Column column = columnRepository.findById(columnId).orElseThrow(ColumnNotFoundException::new);
        int previousColumnSize = column.sizeOfTaskList();
        column.removeTaskById(taskId);
        columnRepository.save(column);

        column = columnRepository.findById(columnId).orElseThrow(ColumnNotFoundException::new);
        int currentColumnSize = column.sizeOfTaskList();

        assertThat(currentColumnSize).isEqualTo(previousColumnSize - 1);
    }

    @Test
    @DisplayName("태스크를 업데이트 할 수 있어야 합니다")
    void testUpdateTask() {
        User user = createUserAndInitColumn();

        Long taskId = user.getColumnList().get(0).getTaskList().get(0).getId();

        Task task = taskRepository.findById(taskId).orElseThrow(TaskNotFoundException::new);
        String updatedTitle = "updatedTitle";
        String updatedContent = "updatedContent";
        task.update(updatedTitle, updatedContent);
        Task expectedTask = new Task(updatedTitle, updatedContent);
        taskRepository.save(task);

        task = taskRepository.findById(taskId).orElseThrow(TaskNotFoundException::new);
        assertThat(task.isSameTitle(expectedTask)).isTrue();
        assertThat(task.isSameContent(expectedTask)).isTrue();
    }
}
