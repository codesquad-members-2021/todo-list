package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.exceptions.TodoColumnNotFoundException;
import com.codesquad.todo.web.exceptions.TodoTaskNotFoundException;
import com.codesquad.todo.web.exceptions.TodoUserNotFoundException;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.jdbc.DataJdbcTest;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@DataJdbcTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class TodoTodoUserRepositoryTest {

    private static final Logger logger = LoggerFactory.getLogger(TodoTodoUserRepositoryTest.class);

    @Autowired
    private TodoUserRepository todoUserRepository;

    @Autowired
    private TodoColumnRepository todoColumnRepository;

    @Autowired
    private TodoTaskRepository todoTaskRepository;

    @Test
    @DisplayName("어그리게이션 루트인 유저에 컬럼을 추가할 수 있어야 합니다")
    void testColumnCreation() {
        createColumns(createUser());
        List<TodoColumn> todoColumnList = todoColumnRepository.findAll();
        List<TodoColumn> expectedTodoColumnList = new ArrayList<>();
        expectedTodoColumnList.add(new TodoColumn("TODO"));
        expectedTodoColumnList.add(new TodoColumn("IN_PROGRESS"));
        expectedTodoColumnList.add(new TodoColumn("DONE"));

        assertThat(todoColumnList.size()).isEqualTo(expectedTodoColumnList.size());
        for (int i = 0; i < todoColumnList.size(); i++) {
            assertThat(todoColumnList.get(i).isSameTitle(expectedTodoColumnList.get(i))).isTrue();
        }
    }

    private TodoUser createUser() {
        TodoUser todoUser = new TodoUser("asdf", "asdf", "1234", "image");
        return todoUserRepository.save(todoUser);
    }

    private void createColumns(TodoUser todoUser) {
        todoUser.addColumn("TODO");
        todoUser.addColumn("IN_PROGRESS");
        todoUser.addColumn("DONE");
        todoUserRepository.save(todoUser);
    }

    @Test
    @DisplayName("태스크를 생성해서 컬럼에 추가할 수 있어야 합니다")
    void testTaskCreation() {
        TodoUser todoUser = createUserAndInitColumn();

        List<TodoColumn> todoColumnList = todoUser.getColumnList();
        List<TodoColumn> expectedTodoColumnList = createColumnList();

        assertThat(todoColumnList.size()).isEqualTo(expectedTodoColumnList.size());
        for (int i = 0; i < todoColumnList.size(); i++) {
            TodoColumn currentTodoColumn = todoColumnList.get(i);
            TodoColumn expectedCurrentTodoColumn = expectedTodoColumnList.get(i);
            assertThat(currentTodoColumn.isSameTitle(expectedCurrentTodoColumn)).isTrue();

            assertThat(currentTodoColumn.sizeOfTaskList()).isEqualTo(expectedCurrentTodoColumn.sizeOfTaskList());
            for (int j = 0; j < currentTodoColumn.sizeOfTaskList(); j++) {
                TodoTask currentTodoTask = currentTodoColumn.getTaskList().get(j);
                TodoTask expectedCurrentTodoTask = expectedCurrentTodoColumn.getTaskList().get(j);

                assertThat(currentTodoTask.isSameTitle(expectedCurrentTodoTask)).isTrue();
            }
        }
    }

    private List<TodoColumn> createColumnList() {
        List<TodoColumn> todoColumnList = new ArrayList<>();
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
        doneTodoColumn.addTask("title8", "content8");

        todoColumnList.add(todoColumn);
        todoColumnList.add(inProgressTodoColumn);
        todoColumnList.add(doneTodoColumn);
        return todoColumnList;
    }

    private TodoUser createUserAndInitColumn() {
        TodoUser todoUser = createUser();
        List<TodoColumn> todoColumnList = createColumnList();
        for (TodoColumn todoColumn : todoColumnList) {
            todoUser.addColumn(todoColumn);
        }
        todoUserRepository.save(todoUser);
        return todoUserRepository.findById(todoUser.getId()).orElseThrow(TodoUserNotFoundException::new);
    }


    @Test
    @DisplayName("컬럼 내부에서 태스크를 옮길 수 있어야 합니다")
    void testMoveTaskInSameColumn() {
        TodoUser todoUser = createUserAndInitColumn();
        Long prevColumnId = todoUser.getColumnList().get(0).getId();
        Long nextColumnId = todoUser.getColumnList().get(2).getId();
        Long taskId = todoUser.getColumnList().get(0).getTaskList().get(0).getId();
        int newTaskPosition = 0;
        todoUser.moveTask(prevColumnId, nextColumnId, taskId, newTaskPosition);
        todoUserRepository.save(todoUser);

        todoUser = todoUserRepository.findById(todoUser.getId()).orElseThrow(TodoUserNotFoundException::new);

        assertThat(todoUser.getColumnList().get(2).getTaskList().get(0).isSameId(taskId)).isTrue();
    }

    @Test
    @DisplayName("컬럼 내부에서 태스크를 옮길 수 있어야 합니다 II")
    void testMoveTaskInSameColumnII() {
        TodoUser todoUser = createUserAndInitColumn();
        Long prevColumnId = todoUser.getColumnList().get(0).getId();
        Long nextColumnId = todoUser.getColumnList().get(2).getId();
        Long taskId = todoUser.getColumnList().get(0).getTaskList().get(0).getId();
        int newTaskPosition = 2;
        todoUser.moveTask(prevColumnId, nextColumnId, taskId, newTaskPosition);
        todoUserRepository.save(todoUser);

        todoUser = todoUserRepository.findById(todoUser.getId()).orElseThrow(TodoUserNotFoundException::new);

        assertThat(todoUser.getColumnList().get(2).getTaskList().get(2).isSameId(taskId)).isTrue();
    }

    @Test
    @DisplayName("컬럼에서 태스크를 지울 수 있어야 합니다")
    void testRemoveTaskById() {
        TodoUser todoUser = createUserAndInitColumn();

        Long columnId = todoUser.getColumnList().get(0).getId();
        Long taskId = todoUser.getColumnList().get(0).getTaskList().get(0).getId();

        TodoColumn todoColumn = todoColumnRepository.findById(columnId).orElseThrow(TodoColumnNotFoundException::new);
        int previousColumnSize = todoColumn.sizeOfTaskList();
        todoColumn.removeTaskById(taskId);
        todoColumnRepository.save(todoColumn);

        todoColumn = todoColumnRepository.findById(columnId).orElseThrow(TodoColumnNotFoundException::new);
        int currentColumnSize = todoColumn.sizeOfTaskList();

        assertThat(currentColumnSize).isEqualTo(previousColumnSize - 1);
    }

    @Test
    @DisplayName("태스크를 업데이트 할 수 있어야 합니다")
    void testUpdateTask() {
        TodoUser todoUser = createUserAndInitColumn();

        Long taskId = todoUser.getColumnList().get(0).getTaskList().get(0).getId();

        TodoTask todoTask = todoTaskRepository.findById(taskId).orElseThrow(TodoTaskNotFoundException::new);
        String updatedTitle = "updatedTitle";
        String updatedContent = "updatedContent";
        todoTask.update(updatedTitle, updatedContent);
        TodoTask expectedTodoTask = new TodoTask(updatedTitle, updatedContent);
        todoTaskRepository.save(todoTask);

        todoTask = todoTaskRepository.findById(taskId).orElseThrow(TodoTaskNotFoundException::new);
        assertThat(todoTask.isSameTitle(expectedTodoTask)).isTrue();
        assertThat(todoTask.isSameContent(expectedTodoTask)).isTrue();
    }
}
