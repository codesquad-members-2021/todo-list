import "./App.scss";
import { useState, useEffect } from "react";
import useToggle from '../../hooks/useToggle';
import axios from "axios";
import Header from "../molecules/Header";
import TodoTitle from "../molecules/TodoTitle";
import ButtonList from "../molecules/ButtonList";
import TodoListWrap from "../molecules/TodoListWrap";
import HistoryContent from '../organisms/HistoryContent';

function App() {
  const [isOpen, isOpenActions] = useToggle(false);
  const [todos, setTodos] = useState([]);

  useEffect(() => {
    const getData = async () => {
      const { data } = await axios.get("/todos");
      setTodos(data);
    };
    getData();
  }, []);

  useEffect(() => {
    console.log(todos)
  }, [todos]);

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
      </TodoListWrap>
    </div>
  );
}

export default App;
