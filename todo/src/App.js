import "./App.scss";
import Title from "./components/molecules/Title";
import TodoList from "./components/molecules/TodoList";
import TodoListItem from "./components/molecules/TodoListItem";

function App() {
  return (
    <div className="App">
      <Title></Title>
      <TodoList>
        <TodoListItem></TodoListItem>
        <TodoListItem></TodoListItem>
      </TodoList>
      <TodoList>
        <TodoListItem></TodoListItem>
        <TodoListItem></TodoListItem>
      </TodoList>
      <TodoList>
        <TodoListItem></TodoListItem>
        <TodoListItem></TodoListItem>
        <TodoListItem></TodoListItem>
        <TodoListItem></TodoListItem>
      </TodoList>
    </div>
  );
}

export default App;
