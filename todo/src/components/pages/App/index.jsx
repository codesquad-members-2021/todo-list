import { useState, useEffect } from "react";
import useToggle from "../../../hooks/useToggle";
import Header from "../../molecules/Header";
import HistoryList from "../../organisms/HistoryList";
import TodoListWrap from "../../templates/TodoListWrap";
import loadItems from '../../../serviceUtils/loadItems';
import styled from "styled-components";

const Div = styled.div`
  border: 3px solid black;
  background: #63bda4;
  border-radius: 10px;
`;

function App() {
  const [isOpen, isOpenActions] = useToggle(false);
  const [todos, setTodos] = useState([]);
  const [histories, setHistories] = useState([]);

  useEffect(() => {
    loadItems(setTodos, "/todos");
    loadItems(setHistories, '/logs');
  }, [])

  return (
    <Div>
      <HistoryList  {...{ isOpen, isOpenActions, histories }} />
      <Header isOpenActions={isOpenActions} />
      <TodoListWrap {...{ todos, setTodos, setHistories }} ></TodoListWrap>
    </Div>
  );
}

export default App;
