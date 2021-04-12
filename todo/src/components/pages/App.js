import "./App.scss";
import { useState, useEffect } from "react";
import useToggle from '../../hooks/useToggle';
import axios from "axios";
import Header from "../molecules/Header";
import TodoTitle from "../molecules/TodoTitle";
import ButtonList from "../molecules/ButtonList";
import TodoListWrap from "../molecules/TodoListWrap";
import TodoList from '../molecules/TodoList';
import TodoListItem from '../molecules/TodoListItem';
import HistoryContent from '../organisms/HistoryContent';

const getAxios = async (setState, url) => {
  const { data } = await axios.get(url);
  setState(data);
}

function App() {
  const [isOpen, isOpenActions] = useToggle(false);
  const [todoTitle, setTitle] = useState([]);
  const [todos, setTodos] = useState([]);

  useEffect(() => {
    getAxios(setTodos, '/todos');
    getAxios(setTitle, '/sections');
  }, []);

  useEffect(() => {
    console.log(todos);
    console.log(todoTitle)
  }, [todoTitle]);

  return (
    <div className="App">
      <HistoryContent isOpen={isOpen} isOpenActions={isOpenActions} />
      <Header isOpenActions={isOpenActions} />
      <div>
        <TodoTitle>해야할 일</TodoTitle>
      </div>
      <ButtonList isIcon={false} />
      <ButtonList isIcon />
      <TodoListWrap>
        {todoTitle.map(({ id, name }) =>
          <TodoList key={id}>

          </TodoList>
        )}
        <TodoList>
          <TodoListItem />
        </TodoList>
      </TodoListWrap>
    </div>
  );
}

export default App;
