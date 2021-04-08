import './App.scss';
import Header from "./components/molecules/Header";
import TodoTitle from "./components/molecules/TodoTitle";
import HistoryItem from './components/molecules/HistoryItem';
import HistoryList from './components/molecules/HistoryList';


function App() {
  return (
    <div className="App">
      <HistoryList>
        <HistoryItem></HistoryItem>
      </HistoryList>

      <Header />
      <div>
        <TodoTitle>해야할 일</TodoTitle>
      </div>



    </div>

  );
}

export default App;
