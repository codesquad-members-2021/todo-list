import TodoListInput from "../TodoListInput";
import TodoListItem from "../TodoListItem";
import styled, { css } from "styled-components";
import useToggle from "../../../hooks/useToggle";

const Div = styled.div`
  position: relative;
  width: 308px;
  padding: 16px;
  margin: 16px;
  background: #fff;
  border: 2px solid #000;
  border-radius: 5px;
  cursor: pointer;
  ${({ hover }) =>
    hover &&
    css`
      &:hover {
        border: 2px solid blue;
        background: #e0efff;
      }
    `}
`;

const TodoSwitch = ({ columnId, id, title, content, author }) => {
  const [isInput, toggleActions] = useToggle(false);

  let template;

  if (isInput) {
    template = (
      <TodoListInput {...{ columnId, id, title, content, toggleActions }} />
    );
  } else {
    template = (
      <Div hover onClick={toggleActions.toggle}>
        <TodoListItem {...{ id, title, content, author }} />
      </Div>
    );
  }

  return <>{template}</>;
};

export default TodoSwitch;
