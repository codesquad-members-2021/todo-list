import React, { useRef } from "react";
import styled from "styled-components";
import Input from "../../atom/Input.jsx";
import { TodoCardBtnWrapper, TodoCard } from "./TodoItem";

const TodoListForm = ({ addTodoItem, toggleForm }) => {
  //수정완료
  const StyledForm = styled.form``;

  const onSubmitForm = (e) => {
    e.preventDefault();
    const cardId = Date.now();
    const newTodo = {
      id: cardId,
      title: inputTitleRef.current.value,
      content: inputContentRef.current.value,
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
          ref={inputTitleRef}
        />
        <Input
          name="content"
          type="text"
          placeholder="내용을 입력하세요"
          ref={inputContentRef}
        />
        <TodoCardBtnWrapper>
          <button type="submit">등록</button>
          <button onClick={foldForm}>취소</button>
        </TodoCardBtnWrapper>
      </TodoCard>
    </form>
  );
};

export default TodoListForm;

// <TodoCard flexDir="column">
//       <Input
//         defaultValue={inputTitle}
//         handleChange={onChangeTitle}
//         placeholderValue="제목을 입력하세요"
//         name="title"
//       ></Input>
//       <Input
//         defaultValue={inputContent}
//         handleChange={onChangeContent}
//         placeholderValue="내용을 입력하세요"
//         name="content"
//       ></Input>

//       <TodoCardBtnWrapper>
//         <button onClick={editItem}>수정</button>
//         <button onClick={toggleEditForm}>취소</button>
//       </TodoCardBtnWrapper>
//     </TodoCard>
