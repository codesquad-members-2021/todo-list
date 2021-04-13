import "./App.css";
import TodoView from "./component/TodoView.jsx";
import initTodo from "./service/initTodoService.js";
function App() {
  initTodo();
  //보통 여기에 initService같은 함수로 초기값 설정해둔다
  return <TodoView />;
}

export default App;
