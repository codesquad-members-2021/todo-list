import React from "react";
import TodoList from "./todoList/TodoList";

const TodoMain = ({ datas }) => {
  const todoColumneList = datas.todoData.map((data) => (
    <TodoList data={data} />
  ));

  return <div>{todoColumneList}</div>;
};
export default TodoMain;
