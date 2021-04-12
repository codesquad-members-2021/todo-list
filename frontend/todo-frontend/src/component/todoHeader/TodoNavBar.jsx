import React from "react";
import styled from "styled-components";
import TodoLog from "./TodoLog";

const NavBar = styled.div`
  width: 452px;
  background: #fff;
  height: 100%;
  box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5),
    0px 2px 4px rgba(0, 0, 0, 0.25);
  position: absolute;
  top: 0;
  right: 0;
`;

const NavCloseBtn = styled.svg`
  position: absolute;
  right: 0;
  fill: #bdbdbd;
  margin: 16px 80px 0 0;
  &:hover {
    fill: #126e82;
  }
`;

const TodoNavBar = ({ logs, toggleNav }) => {
  const logList = logs.map((log) => TodoLog({ author: "Jenny", log }));
  return (
    <NavBar>
      <NavCloseBtn
        onClick={toggleNav}
        width="12"
        height="12"
        viewBox="0 0 12 12"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path d="M1.5 11.25L0.75 10.5L5.25 6L0.75 1.5L1.5 0.750004L6 5.25L10.5 0.750004L11.25 1.5L6.75 6L11.25 10.5L10.5 11.25L6 6.75L1.5 11.25Z" />
      </NavCloseBtn>

      <div>{logList}</div>
    </NavBar>
  );
};

export default TodoNavBar;
