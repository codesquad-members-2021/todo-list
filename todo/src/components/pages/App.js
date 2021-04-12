import { useState, useEffect } from "react";
import useToggle from "../../hooks/useToggle";
import axios from "axios";
import Header from "../molecules/Header";
import HistoryContent from "../organisms/HistoryContent";
import TodoContent from "../organisms/TodoContent";
import styled from "styled-components";
const getAxios = async (setState, url) => {
  const { data } = await axios.get(url);
  setState(data);
};
const Div = styled.div`
  border: 3px solid black;
  background: #63bda4;
  border-radius: 10px;
`;

function App() {
  const [isOpen, isOpenActions] = useToggle(false);
  const [todos, setTodos] = useState([]);

  useEffect(() => {
    getAxios(setTodos, "/todos");
  }, []);

  useEffect(() => {
    console.log(todos);
  }, [todos]);

  return (
    <Div>
      <HistoryContent isOpen={isOpen} isOpenActions={isOpenActions} />
      <Header isOpenActions={isOpenActions} />
      <TodoContent todos={todos}></TodoContent>
    </Div>
  );
}

export default App;
