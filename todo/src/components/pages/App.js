import "./App.scss";
import { useState, useEffect } from "react";
import useToggle from '../../hooks/useToggle';
import axios from "axios";
import Header from "../molecules/Header";
import TodoTitle from "../molecules/TodoTitle";
import ButtonList from "../molecules/ButtonList";
import TodoListWrap from "../molecules/TodoListWrap";
import HistoryContent from '../organisms/HistoryContent';


// const getData = async () => {
//   axios.get("/api/todos").then(data => console.log(data.json);
// };
// getData();

axios.get("/todos").then(data => console.log(data.data));

function App() {
  const [isOpen, isOpenActions] = useToggle(false);

  return (
    <div className="App">
      <HistoryContent isOpen={isOpen} isOpenActions={isOpenActions} />
      <Header isOpenActions={isOpenActions} />
      <div>
        <TodoTitle>해야할 일</TodoTitle>
      </div>
      <ButtonList isIcon={false} />
      <ButtonList isIcon />
      <TodoListWrap></TodoListWrap>
    </div>
  );
}

export default App;
