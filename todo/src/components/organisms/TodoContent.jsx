import React from "react";
import TodoListItem from "../molecules/TodoListItem";
import TodoListWrap from "../molecules/TodoListWrap";
import TodoListInput from "../molecules/TodoListInput";
import TodoTitle from "../molecules/TodoTitle";
import TodoListForm from "../molecules/TodoListForm";
import TodoListColumn from "../molecules/TodoListColumn";

const TodoContent = ({ todos }) => {
  const getForms = (items) => {
    return items.map(({ id, title, content, author }) => {
      return (
        <TodoListForm id={id}>
          <TodoListItem {...{ title, content, author }}></TodoListItem>
        </TodoListForm>
      );
    })
  }

  return (
    <TodoListWrap>
      {todos.map(({ columnId, columnName, items }) => {
        return (
          <TodoListColumn key={columnId}>
            <TodoTitle>{columnName}</TodoTitle>
            {getForms(items)}
          </TodoListColumn>
        );
      })}
    </TodoListWrap>
  );
};

export default TodoContent;
