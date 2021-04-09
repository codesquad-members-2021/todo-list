import React, { useState } from 'react';

const TodoItem = ({ todoCard: { id, title, content }, deleteTodoItem, editTodoItem }) => {
  const [isEditing, setIsEditing] = useState(false);
  const [inputTitle, setInputTitle] = useState(title);
  const [inputContent, setInputContent] = useState(content);

  const toggleEditForm = () => {
    setInputTitle(title);
    setInputContent(content);
    setIsEditing((isEditing) => !isEditing);
  };

  const editItem = () => {
    const newTodo = {
      id,
      title: inputTitle,
      content: inputContent,
    };
    editTodoItem(id, newTodo);
    toggleEditForm();
  };

  const onChangeTitle = (e) => {
    setInputTitle(e.target.value);
  };
  const onChangeContent = (e) => {
    setInputContent(e.target.value);
  };

  if (isEditing) {
    return (
      <div>
        <input type='text' value={inputTitle} onChange={onChangeTitle} />
        <input type='text' value={inputContent} onChange={onChangeContent} />
        <button onClick={toggleEditForm}>취소</button>
        <button onClick={editItem}>수정</button>
      </div>
    );
  } else {
    return (
      <div onDoubleClick={toggleEditForm}>
        <h4>{title}</h4>
        <div>{content}</div>
        <button onClick={() => deleteTodoItem(id)}>❌</button>
      </div>
    );
  }
};
export default TodoItem;
