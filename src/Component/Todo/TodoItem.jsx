import React, { useState } from "react";
import styled from 'styled-components';
import { FaTimes, FaPencilAlt } from 'react-icons/fa';
import EditTodo from "./EditTodo";
import Button from "../Button";
import { Draggable } from 'react-beautiful-dnd'

const TodoItemBlock = styled.div`
  background-color: #fff;
  border-radius: 0.3rem;
  padding: 0.8rem;
  display: block;
  margin-top: 1rem;
  position: relative;
  & > button {
    padding: 0.4rem;
    line-height: 0rem;
    position: absolute;
    right: 0.5rem;
    margin-top: -0.3rem;
    &:hover {
      color: #ffcc00;
    }
    &:first-child {
      right: 2rem;
    }
  }
`;

const TodoItemContent = styled.div`
  display: ${({toggle}) => !toggle ? 'block' : 'none'};
`;

const Title = styled.input.attrs({
  type: 'text'
})`
  width: 100%;
  font-size: 1.2rem;
  padding-right: 1rem;
  font-weight: 600;
  margin-bottom: 0.3rem;
  pointer-events: none;
`;

const Content = styled.textarea`
  border: 0;
  resize: none;
  font-size: 1rem;
  width: 100%;
  overflow-y: visible;
  height: 3rem;
  pointer-events: none;
  &:focus {
    outline: none;
  }
`;

const TodoItem = ({ title, content, index, onChange, onRemove, id }) => {
  const [toggle, setToggle] = useState(false);
  const onToggle = () => setToggle(!toggle);
  const onTextChange = inputs => {
    onChange(inputs, index);
    onToggle();
  }
  return (
    <Draggable draggableId={id} index={index}>
      {provided => (
        <div ref={provided.innerRef} {...provided.draggableProps} {...provided.dragHandleProps}>
          <TodoItemBlock>
            <Button onClick={onToggle}><FaPencilAlt/></Button>
            <Button onClick={() => onRemove(index)}><FaTimes/></Button>
            <TodoItemContent toggle={toggle}>
              <Title name="title" value={title} readOnly/>
              <Content name="content" value={content} readOnly/>
            </TodoItemContent>
            <EditTodo toggle={toggle} onToggle={onToggle} title={title} content={content} onTextChange={onTextChange}/>
          </TodoItemBlock>
        </div>
      )}
    </Draggable>
  );
}

export default TodoItem;