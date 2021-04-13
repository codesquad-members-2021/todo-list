import React, { useState } from "react";
import styled from "styled-components";
import CreateTodo from "./CreateTodo";
import TodoColumnHead from "./TodoColumnHead";

const TodoColumnBlock = styled.div``;
const TodoItemsBlock = styled.div``;

const TodoColumn = ({title, todoItems}) => {
  const [toggle, setToggle] = useState(false);
  const [todos, setTodos] = useState(todoItems);
  const [count, setCount] = useState(todoItems.length);
  const [inputs, setInputs] = useState({
    title: "",
    content: ""
  });

  const onClick = () => setToggle(!toggle);
  const onSubmit = () => {
    setTodos([...todos, {...inputs}])
    setCount(count + 1);
    setInputs({title: "", content: ""});
  }
  const onCancel = () => {
    setToggle(!toggle);
    setInputs({title: "", content: ""});
  }
  const onChange = ({ target }) => {
    setInputs({...inputs, [target.name] : target.value});
  }
  const onAllDelete = () => {
    setTodos([]);
    setCount(0);
  }
  // const TodoItems = todoItems.map((v, index) => <TodoItem {...v} key={index}/>); 
  return (
    <TodoColumnBlock>
      <TodoColumnHead toggle={toggle} onClick={onClick} onAllDelete={onAllDelete} count={count} title={title}></TodoColumnHead>
      <CreateTodo inputs={inputs} onChange={onChange} onCancel={onCancel} onSubmit={onSubmit} toggle={toggle}></CreateTodo>
      <TodoItemsBlock>
        {/* {TodoItems} */}
      </TodoItemsBlock>
    </TodoColumnBlock>
  )
}

export default TodoColumn;