import "./App.scss";
import Title from "./components/molecules/Title";
import TodoList from "./components/molecules/TodoList";
import TodoListItem from "./components/molecules/TodoListItem";
function App() {
  return (
    <div className="App">
      <Title></Title>
      <TodoListItem></TodoListItem>
    </div>
  );
}

export default App;
