import React, { useState } from "react";
import styled from "styled-components";

function NavigationBar({ mode, setMode }) {
  return (
    <Bar>
      <BarHeader>
        <UpdateList>Update List</UpdateList>
        <CLOSE
          onClick={() => {
            setMode(!mode);
          }}
        >
          나가기
        </CLOSE>
      </BarHeader>
    </Bar>
  );
}

const Bar = styled.div`
  position: absolute;
  box-sizing: border-box;
  top: 40%;
  right: 9%;
  width: 20%;
  height: 350%;
  border: 1px solid black;
  background-color: white;
  transition: ;
`;
const BarHeader = styled.div`
  display: flex;
  justify-content: space-between;
`;

const UpdateList = styled.p`
  margin: 3% 5%;
  font-size: 20px;
`;

const CLOSE = styled.button`
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 15px;
  height: 7%;
  margin: 3% 5%;
  padding: 0;
  background-color: transparent;
  outline: none;
  border: none;
  &:active {
    transform: translateY(2px);
  }
`;

export default NavigationBar;
