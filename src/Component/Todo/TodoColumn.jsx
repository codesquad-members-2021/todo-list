import React, { useState } from "react";
import styled from "styled-components";
import CreateTodo from "./CreateTodo";
import TodoColumnHead from "./TodoColumnHead";
import TodoItem from "./TodoItem";

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
    setTodos([...todos, {...inputs}]);
    setCount(count + 1);
    setInputs({title: "", content: ""});
    setToggle(!toggle);
  }
  const onCancel = () => {
    setToggle(!toggle);
    setInputs({title: "", content: ""});
  }
  const onChange = ({ target }) => {
    setInputs({...inputs, [target.name] : target.value});
  }
  const onAllRemove = () => {
    setTodos([]);
    setCount(0);
  }
  const onRemove = (index) => {
    setTodos(todos.filter((v, i) => i !== index));
    setCount(count - 1);
  }
  const onTodoItemChange = (e, index) => {
    setTodos(todos.map((v, i) => {
      e.preventDefault();
      if(i === index) v[e.target.name] = e.target.value;
      return v;
    }));
  } 
  const TodoItems = todos.map((v, index) => <TodoItem {...v} index={index} onChange={onTodoItemChange} onRemove={onRemove} key={index}/>); 
  return (
    <TodoColumnBlock>
      <TodoColumnHead toggle={toggle} onClick={onClick} onAllRemove={onAllRemove} count={count} title={title}></TodoColumnHead>
      <CreateTodo inputs={inputs} onChange={onChange} onCancel={onCancel} onSubmit={onSubmit} toggle={toggle}></CreateTodo>
      <TodoItemsBlock>
        {TodoItems}
      </TodoItemsBlock>
    </TodoColumnBlock>
  )
}

export default TodoColumn;