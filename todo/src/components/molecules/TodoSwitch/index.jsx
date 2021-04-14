import TodoListInput from "../TodoListInput";
import TodoListItem from "../TodoListItem";
import styled, { css } from "styled-components";
import useToggle from "../../../hooks/useToggle";

const TodoSwitch = ({
  isClicked,
  columnId,
  id,
  title,
  content,
  author,
  toggleActions,
  setTodos,
  setHistories,
  columnName
}) => {
  const [isInput, toggleActions2] = useToggle(false);

  let template;
  if (isInput || isClicked) {
    template = (
      <TodoListInput
        {...{ setTodos, columnName, columnId, id, title, content, toggleActions2, toggleActions, setHistories }}
      />
    );
  } else {
    template = (
      <div onClick={toggleActions2.toggle}>
        <TodoListItem {...{ id, title, content, author, setHistories }} />
      </div>
    );
  }

  return <>{template}</>;
};

export default TodoSwitch;
