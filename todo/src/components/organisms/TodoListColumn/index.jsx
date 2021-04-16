import styled from "styled-components";
import TodoTitle from "../../molecules/TodoTitle";
import { useRef } from 'react';
import TodoListInput from "../../molecules/TodoListInput";
import TodoSwitch from "../../molecules/TodoSwitch";
import useToggle from "../../../hooks/useToggle";
const Div = styled.div`
  margin: 5px;
`;

const TodoListColumn = ({
  setTodos,
  columnId,
  columnName,
  items,
  setHistories,
  setPopup,
  setIdState,
  setColState,
  dragged,
  titleRef
}) => {
  const [isClicked, toggleActions] = useToggle(false);
  let template;

  if (!isClicked) {
    template = (
      <Div>
        <TodoTitle
          titleRef={titleRef}
          addTodo={toggleActions.toggle}
          itemCount={items.length}
          columnId={columnId}
        >
          {columnName}
        </TodoTitle>
        {items.map(({ id, title, content, author }) => {
          return (
            <TodoSwitch
              key={id}
              {...{
                setTodos,
                columnName,
                columnId,
                id,
                title,
                content,
                author,
                setHistories,
                setPopup,
                setIdState,
                setColState,
                dragged
              }}
            ></TodoSwitch>
          );
        })}
      </Div>
    );
  } else {
    template = (
      <Div>
        <TodoTitle addTodo={toggleActions.toggle} itemCount={items.length}>
          {columnName}
        </TodoTitle>
        <TodoSwitch
          {...{

            columnId,
            isClicked,
            columnName,
            toggleActions,
            setTodos,
            setHistories,
            setPopup,
            setIdState,
            setColState,
            dragged
          }}
        />
        {items.map(({ id, title, content, author }) => {
          return (
            <TodoSwitch
              key={id}
              {...{
                setTodos,
                columnName,
                columnId,
                id,
                title,
                content,
                author,
                setHistories,
                setPopup,
                setIdState,
                setColState,
                dragged
              }}
            ></TodoSwitch>
          );
        })}
      </Div>
    );
  }

  return <>{template}</>;
};

export default TodoListColumn;
