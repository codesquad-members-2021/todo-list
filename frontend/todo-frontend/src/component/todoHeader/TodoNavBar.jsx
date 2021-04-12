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

const NavCloseBtn = styled.button`
  position: absolute;
  right: 0;
`;

const TodoNavBar = ({ logs, toggleNav }) => {
  const logList = logs.map((log) => TodoLog({ author: "Jenny", log }));
  return (
    <NavBar>
      <NavCloseBtn onClick={toggleNav}>X</NavCloseBtn>
      <div>{logList}</div>
    </NavBar>
  );
};

export default TodoNavBar;
