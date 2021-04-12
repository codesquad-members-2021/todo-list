import React, { useState } from "react";
import styled from "styled-components";
import TodoNavBar from "./TodoNavBar";

const StyledTodoHeader = styled.div`
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  height: 112px;
  padding: 33px 80px;
`;
const HeaderTitle = styled.span`
  height: 46px;
  width: 171px;
  font-size: 2rem;
`;

const HeaderMenuButton = styled.svg`
  fill: rgba(0, 0, 0, 1);
  &:hover {
    fill: rgba(0, 117, 222, 1);
  }
`;

const TodoHeader = ({ logs }) => {
  const [navSelected, setNavSelected] = useState(false);
  const toggleNav = () => {
    setNavSelected((navSelected) => !navSelected);
  };
  return (
    <StyledTodoHeader>
      <HeaderTitle>TODO LIST</HeaderTitle>
      {navSelected ? (
        <TodoNavBar logs={logs} toggleNav={toggleNav} />
      ) : (
        <HeaderMenuButton
          onClick={toggleNav}
          width="17"
          height="11"
          viewBox="0 0 17 11"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path d="M0 1V0H17V1H0ZM17 5V6H0V5H17ZM0 10H17V11H0V10Z" />
        </HeaderMenuButton>
      )}
    </StyledTodoHeader>
  );
};

export default TodoHeader;
