import React, { useState } from 'react'
import styled from 'styled-components'
import CreateTodo from './CreateTodo'
import TodoColumnHead from './TodoColumnHead'
import TodoItem from './TodoItem'
import {
  useTodoState,
  useTodoDispatch,
  useHistoyDispatch,
} from '../Context'

const TodoColumnBlock = styled.div``
const TodoItemsBlock = styled.div``

const TodoColumn = ({ title, todoItems, index }) => {
  const [toggle, setToggle] = useState(false)
  const [todos, setTodos] = useState(todoItems);
  const [count, setCount] = useState(todoItems.length)

  const onClick = () => setToggle(!toggle)
  const dispatch = useTodoDispatch()
  const hisDispatch = useHistoyDispatch()
  const state = useTodoState()
  const onSubmit = inputs => {
    dispatch({ type: 'CREATEITEM', idx: index, item: { ...inputs } })
    hisDispatch({
      type: '생성',
      itemTitle: { ...inputs }.title,
      columnTitle: state[index].title,
      time: new Date().toUTCString()
    });
    setToggle(!toggle);
    setCount(count + 1);
    setTodos([...todos, {...inputs}]);
  }

  const onAllRemove = () => {
    dispatch({ type: 'RESETITEM', idx: index })
    setCount(0)
    setTodos([]);
  }
  const onRemove = itemIndex => {
    hisDispatch({
      type: '삭제',
      title: '설계하기',
      itemTitle: state[index].todoItems[itemIndex].title,
      columnTitle: state[index].title,
      time: new Date().toUTCString()
    })
    const tmp = todos.filter((v, i) => i !== itemIndex);
    dispatch({ type: 'REMOVEITEM', idx: index, todos : tmp });
    setCount(count - 1);
    setTodos(tmp);
  }


  const onTodoItemChange = (value, idx) => {
    const tmp = todos.map((v, i) => {
      if (i === idx) v = value;
      return v;
    })
    dispatch({ type: 'UPDATEITEM', idx: index, todos : tmp });
    hisDispatch({
      type: '수정',
      itemTitle: value.title,
      columnTitle: state[index].title,
      time: new Date().toUTCString()
    })
  }

  const TodoItems = todos.map((v, index) => (
    <TodoItem
      {...v}
      index={index}
      onChange={onTodoItemChange}
      onRemove={onRemove}
      key={index}
    />
  ))
  return (
    <TodoColumnBlock>
      <TodoColumnHead
        toggle={toggle}
        onClick={onClick}
        onAllRemove={onAllRemove}
        count={count}
        title={title}
      ></TodoColumnHead>
      <CreateTodo
        onSubmit={onSubmit}
        toggle={toggle}
        setToggle={setToggle}
      ></CreateTodo>
      <TodoItemsBlock>{TodoItems}</TodoItemsBlock>
    </TodoColumnBlock>
  )
}

export default TodoColumn
