import './App.scss';
import Header from "./components/molecules/Header";
import TodoTitle from "./components/molecules/TodoTitle";
import HistoryItem from './components/molecules/HistoryItem';
import HistoryList from './components/molecules/HistoryList';
import ButtonList from './components/molecules/ButtonList';


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
      <ButtonList isIcon={false}></ButtonList>
      <ButtonList isIcon={true}></ButtonList>
    </div>
  );
}

export default App;