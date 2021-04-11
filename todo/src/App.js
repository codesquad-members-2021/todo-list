import "./App.scss";
import { useState, useEffect } from "react";
import axios from "axios";
import Header from "./components/molecules/Header";
import TodoTitle from "./components/molecules/TodoTitle";
import HistoryList from "./components/molecules/HistoryList";
import ButtonList from "./components/molecules/ButtonList";
import TodoListItem from "./components/molecules/TodoListItem";
import TodoList from "./components/molecules/TodoList";
import TodoListWrap from "./components/molecules/TodoListWrap";

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
