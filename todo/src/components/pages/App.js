import "./App.scss";
import { useState, useEffect } from "react";
import useToggle from "../../hooks/useToggle";
import axios from "axios";
import Header from "../molecules/Header";
import HistoryContent from "../organisms/HistoryContent";
import TodoContent from "../organisms/TodoContent";
const getAxios = async (setState, url) => {
  const { data } = await axios.get(url);
  setState(data);
};

function App() {
  const [isOpen, isOpenActions] = useToggle(false);
  const [todoTitle, setTitle] = useState([]);
  const [todos, setTodos] = useState([]);

  useEffect(() => {
    getAxios(setTodos, "/todos");
    getAxios(setTitle, "/sections");
  }, []);

  useEffect(() => {
    console.log(todos);
    console.log(todoTitle);
  }, [todoTitle]);

  return (
    <div className="App">
      <HistoryContent isOpen={isOpen} isOpenActions={isOpenActions} />
      <Header isOpenActions={isOpenActions} />
      <TodoContent></TodoContent>
    </div>
  );
}

export default App;
