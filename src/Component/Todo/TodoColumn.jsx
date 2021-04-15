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
  const [todos, setTodos] = useState(todoItems)
  const [count, setCount] = useState(todoItems.length)
  const [inputs, setInputs] = useState({
    title: '',
    content: ''
  })

  const onClick = () => setToggle(!toggle)
  const dispatch = useTodoDispatch()
  const hisDispatch = useHistoyDispatch()
  const state = useTodoState()
  const onSubmit = () => {
    setCount(count + 1)
    dispatch({ type: 'CREATEITEM', idx: index, item: { ...inputs } })
    setTodos([...todos, { ...inputs }]);
    setInputs({ title: '', content: '' })
    setToggle(!toggle)
    hisDispatch({
      type: '생성',
      itemTitle: { ...inputs }.title,
      columnTitle: state[index].title,
      time: new Date().toUTCString()
    })
  }
  const onCancel = () => {
    setToggle(!toggle)
    setInputs({ title: '', content: '' })
  }
  const onChange = ({ target }) => {
    setInputs({ ...inputs, [target.name]: target.value })
  }
  const onAllRemove = () => {
    setTodos([])
    dispatch({ type: 'RESETITEM', idx: index })
    setCount(0)
  }
  const onRemove = itemIndex => {
    hisDispatch({
      type: '삭제',
      title: '설계하기',
      itemTitle: state[index].todoItems[itemIndex].title,
      columnTitle: state[index].title,
      time: new Date().toUTCString()
    })
    setTodos(todos.filter((v, i) => i !== itemIndex));
    dispatch({ type: 'REMOVEITEM', idx: index, todos : todos.filter((v, i) => i !== itemIndex) })
    setCount(count - 1)
  }

  // let time;
  const onTodoItemChange = (value, idx) => {
    // clearTimeout(time);
    // time = setTimeout(() => {
    setTodos(
      todos.map((v, i) => {
        if (i === idx) v = value;
        return v;
      })
    )
    dispatch({ type: 'UPDATEITEM', idx: index, todos });
    hisDispatch({
      type: '수정',
      itemTitle: value.title,
      columnTitle: state[index].title,
      time: new Date().toUTCString()
    })
    // }, 5000);
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
        inputs={inputs}
        onChange={onChange}
        onCancel={onCancel}
        onSubmit={onSubmit}
        toggle={toggle}
      ></CreateTodo>
      <TodoItemsBlock>{TodoItems}</TodoItemsBlock>
    </TodoColumnBlock>
  )
}

export default TodoColumn
