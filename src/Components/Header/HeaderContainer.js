import React, { useState } from "react";
import styled, { keyframes } from "styled-components";
import HeaderPresentational from "./HeaderPresentational";
import SideNavigator from "../SideNavigator/SideNavigator";

function HeaderContainer() {
  // 투두 히스토리, 샛투두 히스토리
  const [mode, setMode] = useState(false);
  const [play, setPlay] = useState("end");

  return (
    <Container>
      <HeaderPresentational />
      <NavigationInput
        type="button"
        mode={mode}
        value={mode ? "" : "MENU"}
        onClick={() => {
          mode ? setMode(false) : setMode(true);
          setPlay("start");
        }}
      />
      {play === "start" ? (
        <SideNavigator mode={mode} setMode={setMode}></SideNavigator>
      ) : null}
    </Container>
  );
}

const slowView = keyframes`
  from{
        opacity:0;
    }
    to {
        opacity:1;
    }
`;

const Container = styled.div`
  display: flex;
  font-size: 20px;
  padding: 5% 0;
  box-sizing: border-box;
  width: 100%;
  justify-content: space-between;
`;

const NavigationInput = styled.input`
  cursor: pointer;
  font-size: 20px;
  background-color: white;
  outline: none;
  border: none;
  &:active {
    transform: translateY(2px);
  }

  animation-duration: 0.4s;
  animation-timing-function: ease-in-out;
  animation-name: ${(props) => (props.mode ? null : slowView)};
`;

export default HeaderContainer;
