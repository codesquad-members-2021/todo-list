import React, { useReducer, createContext, useContext, useRef } from 'react'
import test from './Todo/test.json'
const initialTodos = test.todoColumns

let history = []
if (localStorage.getItem('historyList')) {
  history = JSON.parse(localStorage.getItem('historyList'))
} else {
  localStorage.setItem('historyList', '[]')
}

function historyReducer (state, action) {
  switch (action.type) {
    case '생성':
      return state.concat({
        text: `<b>${action.itemTitle}</b> 을(를) <b>${action.columnTitle}</b>에 <b>${action.type}</b>하였습니다.`,
        time: action.time
      })
    case 'REMOVE':
      return state.concat({
        text: `<b>${action.itemTitle}</b> 을(를) <b>${action.columnTitle}</b>에 <b>${action.type}</b>하였습니다.`,
        time: action.time
      })
    case 'RESET':
      return state.concat({
        text: `<b>${action.itemTitle}</b> 을(를) <b>${action.columnTitle}</b>에 <b>${action.type}</b>하였습니다.`,
        time: action.time
      })
    default:
      throw new Error(`Unhandled action type: ${action.type}`)
  }
}

function todoReducer (state, action) {
  switch (action.type) {
    case 'CREATE':
      return state.concat(action.todo)
    case 'UPDATEITEM':
      return state.map((todoColum, index) =>
        index === action.idx
          ? { ...todoColum, todoItems: todoColum.todoItems.concat(action.item) }
          : todoColum
      )
    case 'REMOVEITEM':
      return state.map((todoColum, index) =>
        index === action.idx
          ? {
              ...todoColum,
              todoItems: todoColum.todoItems.filter(
                (v, i) => i !== action.itemIdx
              )
            }
          : todoColum
      )
    case 'REMOVE':
      return state.filter((todoColum, index) => index !== action.idx)
    case 'RESETITEM':
      return state.map((todoColum, index) =>
        index === action.idx ? { ...todoColum, todoItems: [] } : todoColum
      )
    default:
      throw new Error(`Unhandled action type: ${action.type}`)
  }
}

const TodoStateContext = createContext()
const TodoDispatchContext = createContext()
const TodoUserNameContext = createContext()
const HistoyStateContext = createContext()
const HisDispatchContext = createContext()

export function TodoProvider ({ children }) {
  const [state, dispatch] = useReducer(todoReducer, initialTodos)
  const [histoyState, hisdispatch] = useReducer(historyReducer, history)
  const userName = useRef(test.author)

  return (
    <TodoStateContext.Provider value={state}>
      <TodoDispatchContext.Provider value={dispatch}>
        <TodoUserNameContext.Provider value={userName}>
          <HistoyStateContext.Provider value={histoyState}>
            <HisDispatchContext.Provider value={hisdispatch}>
              {children}
            </HisDispatchContext.Provider>
          </HistoyStateContext.Provider>
        </TodoUserNameContext.Provider>
      </TodoDispatchContext.Provider>
    </TodoStateContext.Provider>
  )
}

export function useTodoState () {
  return useContext(TodoStateContext)
}

export function useTodoDispatch () {
  return useContext(TodoDispatchContext)
}

export function useTodoUserNameContext () {
  return useContext(TodoUserNameContext)
}

export function useHistoyState () {
  return useContext(HistoyStateContext)
}

export function useHistoyDispatch () {
  return useContext(HisDispatchContext)
}
