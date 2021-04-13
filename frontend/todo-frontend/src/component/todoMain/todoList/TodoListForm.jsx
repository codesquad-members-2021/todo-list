import React, { useRef } from "react";
import Input from "../../atom/Input.jsx";
import { TodoCardBtnWrapper, TodoCard } from "./TodoItem";
import { ConfirmBtn, CancelBtn } from "../../atom/Button.jsx";

const TodoListForm = ({ addTodoItem, toggleForm }) => {
  //수정완료

  const onSubmitForm = (e) => {
    e.preventDefault();
    const cardId = Date.now();
    const newTodo = {
      id: cardId,
      title: inputTitleRef.current.value,
      content: inputContentRef.current.value,
      date: Date.now(),
    };
    addTodoItem(newTodo.id, newTodo);

    inputTitleRef.current.value = "";
    inputContentRef.current.value = "";

    toggleForm();
  };

  const foldForm = (e) => {
    e.preventDefault();
    toggleForm();
  };

  const inputTitleRef = useRef(); //inputTitleRef.current.value
  const inputContentRef = useRef(); //inputContentRef.current.value

  return (
    <form
      onSubmit={onSubmitForm}
      addTodoItem={addTodoItem}
      toggleForm={toggleForm}
    >
      <TodoCard flexDir="column">
        <Input
          name="title"
          type="text"
          placeholder="제목을 입력하세요"
          inputRef={inputTitleRef}
        />
        <Input
          name="content"
          type="text"
          placeholder="내용을 입력하세요"
          inputRef={inputContentRef}
        />
        <TodoCardBtnWrapper>
          <ConfirmBtn value="등록" type="submit" />
          <CancelBtn value="취소" handleClick={foldForm} />
        </TodoCardBtnWrapper>
      </TodoCard>
    </form>
  );
};

export default TodoListForm;
