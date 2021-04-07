import React, { useState } from "react";
import styled from "styled-components";
import NavigationBar from "./navigationBar";

function HeaderPresentational() {
  const [mode, setMode] = useState(false);
  const [play, setPlay] = useState("end");

  return (
    <div>
      <Header>
        <div>Todo-List</div>
        <Header_button
          type="button"
          value={mode ? "EXIT" : "MENU"}
          onClick={() => {
            mode ? setMode(false) : setMode(true);
            setPlay("start");
          }}
        />
        {play === "start" ? (
          <NavigationBar mode={mode} setMode={setMode}></NavigationBar>
        ) : null}
      </Header>
    </div>
  );
}

const Header = styled.section`
  display: flex;
  position: relative;
  padding: 5% 10%;
  box-sizing: border-box;
  width: 100%;
  justify-content: space-between;
`;

const Header_button = styled.input`
  background-color: white;
  outline: none;
  border: none;
  &:active {
    transform: translateY(2px);
  }
`;
export default HeaderPresentational;
