import React, { useState } from "react";
import styled from "styled-components";
import Header from "./HeaderPresen";
import NavigationBar from "./navigationBar";

function HeaderContainer() {
  // 투두 히스토리, 샛투두 히스토리
  const [mode, setMode] = useState(false);
  const [play, setPlay] = useState("end");

  return (
    <Container>
      <Header />
      <NavigationInput
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
    </Container>
  );
}

const Container = styled.div`
  display: flex;
  position: relative;
  padding: 5% 10%;
  box-sizing: border-box;
  width: 100%;
  justify-content: space-between;
`;

const NavigationInput = styled.input`
  background-color: white;
  outline: none;
  border: none;
  &:active {
    transform: translateY(2px);
  }
`;

export default HeaderContainer;
