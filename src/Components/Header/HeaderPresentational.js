import React, { useState } from "react";
import styled from "styled-components";

function HeaderPresentational() {
  const [mode, setMode] = useState(false);

  return (
    <div>
      <Header>
        <div>Todo-List</div>
        <Header_button
          type="button"
          value="◀"
          onClick={() => {
            mode === false ? setMode(true) : setMode(false);
          }}
        />
      </Header>
      {!mode ? null : (
        <NAVIGATION>
          <CLOSE
            onClick={() => {
              mode ? setMode(false) : setMode(true);
            }}
          >
            ❌
          </CLOSE>
        </NAVIGATION>
      )}
    </div>
  );
}

const Header = styled.section`
  display: flex;
  position: relative;
  padding: 50px 100px;
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
const NAVIGATION = styled.div`
  position: absolute;
  top: 50px;
  right: 100px;
  width: 20%;
  height: 100px;
  background-color: white;
`;
const CLOSE = styled.button`
  background-color: transparent;
  float: right;
  outline: none;
  border: none;
  &:active {
    transform: translateY(2px);
  }
`;

export default HeaderPresentational;
