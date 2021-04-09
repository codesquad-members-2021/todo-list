import React, { useState } from "react";
import TodoList from "./todoList/TodoList";
import style from "./todoMain.module.css";

const TodoMain = ({ datas }) => {
  const [todoColumns, setTodoColumns] = useState(datas.todoData);

  const deleteTodoColumn = (id) => {
    setTodoColumns((todoColumns) =>
      todoColumns.filter((todoCol) => todoCol.id !== id)
    );
  };

  const todoColumneList = todoColumns.map((data) => (
    <TodoList data={data} deleteTodoColumn={deleteTodoColumn} />
  ));

  return <div className={style.todoContainer}>{todoColumneList}</div>;
};
export default TodoMain;
