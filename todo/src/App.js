import "./App.scss";
import { useState } from 'react';
import Header from "./components/molecules/Header";
import TodoTitle from "./components/molecules/TodoTitle";
import HistoryList from "./components/molecules/HistoryList";
import ButtonList from "./components/molecules/ButtonList";
import TodoListItem from "./components/molecules/TodoListItem";
import TodoList from "./components/molecules/TodoList";
import TodoListWrap from "./components/molecules/TodoListWrap";


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
      <TodoListWrap>
        <TodoList>
          <TodoListItem />
          <TodoListItem />
        </TodoList>
        <TodoList>
          <TodoListItem />
          <TodoListItem />
          <TodoListItem />
        </TodoList>
        <TodoList>
          <TodoListItem />
        </TodoList>
      </TodoListWrap>
    </div>
  );
}

export default App;
