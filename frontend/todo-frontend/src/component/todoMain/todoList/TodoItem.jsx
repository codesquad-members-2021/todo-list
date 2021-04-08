import React from "react";

const TodoItem = ({ todoCard: { id, title, content }, deleteTodoItem }) => {
  return (
    <div>
      <h4>{title}</h4>
      <div>{content}</div>
      <button onClick={() => deleteTodoItem(id)}>❌</button>
    </div>
  );
};
export default TodoItem;
