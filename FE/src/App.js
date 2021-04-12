import './App.css';
import Header from './components/Header/Header';
import TodoStore from './components/TodoList/TodoStore';


function App() {
  return (
    <div className="App">
      <Header />
      <TodoStore />
    </div>
  );
}

export default App;
