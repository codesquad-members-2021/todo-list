import './App.css';
import Header from './components/Header/Header';
import TodoStore from './components/TodoList/TodoStore';
import Sidebar from './components/Sidebar/Sidebar';

function App() {
  return (
    <div className="App">
      <Header />
      <TodoStore />
      <Sidebar />
    </div>
  );
}

export default App;
