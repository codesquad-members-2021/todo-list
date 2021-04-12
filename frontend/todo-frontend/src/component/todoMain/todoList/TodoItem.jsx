import React, { useState } from "react";
import DeleteBtn from "../../atom/DeleteBtn.jsx";
import styled from "styled-components";
import Input from "../../atom/Input.jsx";
import { ConfirmBtn } from "../../atom/Button.jsx";

export const TodoCard = styled.div`
  display: flex;
  flex-direction: ${(props) => (props.flexDir === "column" ? "column" : "row")};
  align-items: flex-start;
  padding: 16px;
  width: 308px;
  height: 108px;
  background-color: #ffffff;
  margin-bottom: 20px;
  justify-content: space-between;
  border-radius: 6px;
  box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
`;

export const TodoCardBtnWrapper = styled.div`
  display: flex;
`;

const TodoCardTitle = styled.div`
  font-weight: 700;
  height: 23px;
`;

const TodoCardContent = styled.div`
  font-size: 0.8rem;
  height: 20px;
`;

const TodoItem = ({
  todoCard: { id, title, content },
  deleteTodoItem,
  editTodoItem,
}) => {
  const [isEditing, setIsEditing] = useState(false);
  const [inputTitle, setInputTitle] = useState(title);
  const [inputContent, setInputContent] = useState(content);
  const [isDisabled, setIsDisabled] = useState(false);

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
    if (!e.target.value) setIsDisabled(true);
  };
  const onChangeContent = (e) => {
    setInputContent(e.target.value);
    if (!e.target.value) setIsDisabled(true);
  };

  if (isEditing) {
    return (
      <TodoCard flexDir="column">
        <Input
          defaultValue={inputTitle}
          handleChange={onChangeTitle}
          placeholder="제목을 입력하세요"
          name="title"
        ></Input>
        <Input
          defaultValue={inputContent}
          handleChange={onChangeContent}
          placeholder="내용을 입력하세요"
          name="content"
        ></Input>

        <TodoCardBtnWrapper>
          <ConfirmBtn
            value="수정"
            handleClick={editItem}
            disabled={isDisabled}
          />
          <button onClick={toggleEditForm}>취소</button>
        </TodoCardBtnWrapper>
      </TodoCard>
    );
  } else {
    return (
      <TodoCard onDoubleClick={toggleEditForm} flexDir="row">
        <div>
          <TodoCardTitle>{title}</TodoCardTitle>
          <TodoCardContent>{content}</TodoCardContent>
        </div>
        <DeleteBtn deleteFn={() => deleteTodoItem(id)} />
      </TodoCard>
    );
  }
};
export default TodoItem;
