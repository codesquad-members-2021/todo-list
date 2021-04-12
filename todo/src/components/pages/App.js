import "./App.scss";
import { useState, useEffect } from "react";
import axios from "axios";
import Header from "../molecules/Header";
import TodoTitle from "../molecules/TodoTitle";
import HistoryList from "../molecules/HistoryList";
import ButtonList from "../molecules/ButtonList";
import TodoListItem from "../molecules/TodoListItem";
import TodoList from "../molecules/TodoList";
import TodoListWrap from "../molecules/TodoListWrap";

// const getData = async () => {
//   axios.get("/api/todos").then(data => console.log(data.json);
// };
// getData();

axios.get("/todos").then(data => console.log(data.data));

function App() {
  const [isHide, setHide] = useState(true);

  const toggleClickHandler = () => {
    setHide(!isHide);
  };

  return (
    <div className="App">
      <HistoryList isHide={isHide} toggleClickHandler={toggleClickHandler} />
      <Header toggleClickHandler={toggleClickHandler} />
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
