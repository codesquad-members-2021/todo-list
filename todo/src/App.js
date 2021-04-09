import "./App.scss";
import Header from "./components/molecules/Header";
import TodoTitle from "./components/molecules/TodoTitle";
import HistoryItem from "./components/molecules/HistoryItem";
import HistoryList from "./components/molecules/HistoryList";
import ButtonList from "./components/molecules/ButtonList";
import TodoListItem from "./components/molecules/TodoListItem";
import TodoList from "./components/molecules/TodoList";
import TodoListWrap from "./components/molecules/TodoListWrap";

function App() {
  return (
    <div className="App">
      <HistoryList>
        <HistoryItem />
      </HistoryList>

      <Header />
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
