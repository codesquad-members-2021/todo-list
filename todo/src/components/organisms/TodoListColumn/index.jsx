import styled from "styled-components";
import TodoTitle from "../../molecules/TodoTitle";
import TodoListInput from "../../molecules/TodoListInput";
import TodoSwitch from "../../molecules/TodoSwitch";
import useToggle from "../../../hooks/useToggle";
const Div = styled.div`
  margin: 5px;
`;

const TodoListColumn = ({ setTodos, columnId, columnName, items, setHistories }) => {
  const [isClicked, toggleActions] = useToggle(false);

  let template;

  if (!isClicked) {
    template = (
      <Div>
        <TodoTitle addTodo={toggleActions.toggle} itemCount={items.length}>
          {columnName}
        </TodoTitle>
        {items.map(({ id, title, content, author }) => {
          return (
            <TodoSwitch
              key={id}
              {...{ setTodos, columnName, columnId, id, title, content, author, setHistories }}
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
        <TodoSwitch {...{ isClicked, columnName, toggleActions, setTodos, setHistories }} />
        {items.map(({ id, title, content, author }) => {
          return (
            <TodoSwitch
              key={id}
              {...{ setTodos, columnName, columnId, id, title, content, author, setHistories }}
            ></TodoSwitch>
          );
        })}
      </Div>
    );
  }

  return <>{template}</>;
};

export default TodoListColumn;
