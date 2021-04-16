import React, { useReducer, createContext, useContext, useEffect } from 'react'
import api from "../api";
import { DragDropContext } from 'react-beautiful-dnd'

let history = [];
if (localStorage.getItem('historyList')) {
  history = JSON.parse(localStorage.getItem('historyList'));
} else {
  localStorage.setItem('historyList', '[]');
}

const createInitialTodo = () => {
  return {
    "todoColumns": [
      {
        "title": "해야 할 일",
        "todoItems": []
      },
      {
        "title": "하고 있는 일",
        "todoItems": []
      },
      {
        "title": "끝난 일",
        "todoItems": []
      }
    ],
    "author": "JLM",
  };
};

async function getInitialTodos() {
  const id = localStorage.getItem("id");
  const data = id && await api("get", id);
  return data ? data[0] : createInitialTodo();
}

function historyReducer (state, action) {
  const obj = {};
  switch (action.type) {
    case '생성':
      obj.text = `<b>${action.itemTitle}</b> 을(를) <b>${action.columnTitle}</b>에 <b>${action.type}</b>하였습니다.`;
      break;
    case '수정':
      obj.text = `<b>${action.columnTitle}</b>에 <b>${action.itemTitle}</b> 을(를) <b>${action.type}</b>하였습니다.`;
      break;
    case '삭제':
      obj.text = `<b>${action.columnTitle}</b>에 <b>${action.itemTitle}</b> 을(를) <b>${action.type}</b>하였습니다.`;
      break;
    case 'RESET':
      obj.text = `<b>${action.itemTitle}</b> 을(를) <b>${action.columnTitle}</b>에 <b>${action.type}</b>하였습니다.`;
      break;
    default:
      throw new Error(`Unhandled action type: ${action.type}`)
    }
  obj.time = action.time;
  return [obj , ...state];
}

function todoReducer (state, action) {
  switch (action.type) {
    case 'INIT':
      return action.todoColumns;
    case 'CREATEITEM':
      const todoItems = [...state];
      todoItems[action.idx].todoItems = todoItems[action.idx].todoItems.concat(action.item);
      return todoItems;
    case 'UPDATEITEM':
      const temp = [...state];
      temp[action.idx].todoItems = action.todos;
      return temp;
    case 'REMOVEITEM':
      const tmp = [...state];
      tmp[action.idx].todoItems = action.todos;
      return tmp;
    case 'REMOVECOLUMN':
      return state.filter((todoColumn, index) => index !== action.idx);
    case "CREATECOLUMN":
      return state.concat({
        title: action.title,
        "todoItems": []
      });
    case 'UPDATECOLUMNTITLE':
      const tempB = [...state];
      tempB[action.index].title = action.title;
      return tempB;
    case "MOVEITEM":
      const { before, after } = action;
      const stateTmp = [...state];
      const bcIndex = +before.droppableId[0];
      const acIndex = +after.droppableId[0];
      const beforeItem = stateTmp[bcIndex].todoItems[before.index];
      if(bcIndex === acIndex) {
        if(before.index === after.index) return state;
        const afterItem = stateTmp[acIndex].todoItems[after.index];
        let tmp = [...stateTmp[bcIndex].todoItems];
        const afterColumn = [];
        for(let i = 0; i < tmp.length; i++) {
          if(i === before.index) {
            continue;
          }
          if(i === after.index) {
            if(before.index < after.index) {
              afterColumn.push(tmp[i]);
              afterColumn.push(beforeItem);
              continue;
            }
            afterColumn.push(beforeItem);
          }
          afterColumn.push(tmp[i]);
        }
        stateTmp[bcIndex].todoItems = afterColumn;
        return stateTmp;
      }
      return stateTmp.map((v, i) => {
        let check = false;
        if(i !== bcIndex && i !== acIndex) return v;
        const { todoItems } = v;
        let tmp = [];
        if(i === bcIndex) {
          tmp = todoItems.filter((v, i) => i !== before.index);
        }
        if(i === acIndex) {
          todoItems.forEach((v, i) => {
            if(i === after.index) {
              check = true;
              tmp.push(beforeItem);
            }
            tmp.push(v);
          });
          if(!check) {
            tmp.push(beforeItem);
          }
        }
        v.todoItems = tmp;
        return v;
      });
    default:
      throw new Error(`Unhandled action type: ${action.type}`)
  }
}

function setName(state, action) {
  return action.name;
}

const TodoStateContext = createContext()
const TodoDispatchContext = createContext()
const TodoUserNameContext = createContext()
const HistoyStateContext = createContext()
const HisDispatchContext = createContext()

export function TodoProvider ({ children }) {
  const [state, dispatch] = useReducer(todoReducer, null);
  const [histoyState, hisdispatch] = useReducer(historyReducer, history);
  const [author, nameDispatch] = useReducer(setName, null);
  useEffect(async () => {
    if(!state || !author) {
      const {todoColumns, author } = await getInitialTodos();
      dispatch({ type: "INIT", todoColumns });
      nameDispatch({ name: author });
      return;
    }
    const id = localStorage.getItem("id");
    const req = { todoColumns : state, author};
    if(id) req.id = id;
    const result = await api("post", req);
    if(!id) localStorage.setItem("id", result.id);
  }, [state, author]);

  const onDragEnd = result => {
    if(!result.destination) return;
    dispatch({ type: "MOVEITEM", before: result.source, after: result.destination});
  }

  if (!state || !author) return null;

  return (
    <DragDropContext onDragEnd={onDragEnd}>
      <TodoStateContext.Provider value={state}>
        <TodoDispatchContext.Provider value={dispatch}>
          <TodoUserNameContext.Provider value={[author, nameDispatch]}>
            <HistoyStateContext.Provider value={histoyState}>
              <HisDispatchContext.Provider value={hisdispatch}>
                {children}
              </HisDispatchContext.Provider>
            </HistoyStateContext.Provider>
          </TodoUserNameContext.Provider>
        </TodoDispatchContext.Provider>
      </TodoStateContext.Provider>
    </DragDropContext>
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
