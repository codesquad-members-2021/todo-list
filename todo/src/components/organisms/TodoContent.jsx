import React from "react";
import TodoListItem from "../molecules/TodoListItem";
import TodoListWrap from "../molecules/TodoListWrap";
import TodoListInput from "../molecules/TodoListInput";
import TodoTitle from "../molecules/TodoTitle";
import TodoListForm from "../molecules/TodoListForm";
import TodoListColumn from "../molecules/TodoListColumn";
// add 이벤트 구현

// <ButtonList isIcon={false} />
// <ButtonList isIcon />

const TodoContent = () => {
  return (
    <TodoListWrap>
      <TodoListColumn>
        <TodoTitle>1번</TodoTitle>
        <TodoListForm>
          <TodoListInput></TodoListInput>
        </TodoListForm>
      </TodoListColumn>

      <TodoListColumn>
        <TodoTitle>2번</TodoTitle>
        <TodoListForm>
          <TodoListItem></TodoListItem>
        </TodoListForm>
      </TodoListColumn>

      <TodoListColumn>
        <TodoTitle>3번</TodoTitle>
        <TodoListForm>
          <TodoListItem></TodoListItem>
        </TodoListForm>
      </TodoListColumn>
    </TodoListWrap>
  );
};

export default TodoContent;
