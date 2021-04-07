import React from "react";
import styled, { keyframes } from "styled-components";
import TodoCard from "./TodoCard";

function NavigationBar({ mode }) {
  const obj = [
    { title: "git", author: "neis", age: 28 },
    { title: "javascript", author: "pampam", age: 29 },
    { title: "node", author: "peng", age: 27 },
  ];
  return (
    <Bar style={{ mode }}>
      <BarHeader>
        <UpdateList>Update List</UpdateList>
      </BarHeader>
      {obj.map((v) => {
        return (
          <TodoCard
            key={v.title}
            title={v.title}
            author={v.author}
            age={v.age}
          />
        );
      })}
    </Bar>
  );
}

const slideIn = keyframes`
    from{
        opacity:0;
        transform: translateX(200px);
    }
    to {
        opacity:1;
        transform: translateX(0px);
    }
`;

const slideOut = keyframes`
    from{
        opacity:1;
        transform: translateX(0px);
    }
    to {
        opacity:0;
        transform: translateX(200px);
    }
`;

const Bar = styled.div`
  position: absolute;
  box-sizing: border-box;
  top: 60%;
  right: 10%;
  width: 20%;
  height: 350%;
  border: 1px solid black;
  background-color: white;

  animation-duration: 0.35s;
  animation-timing-function: ease-in-out;
  animation-name: ${(props) => (props.style.mode ? slideIn : slideOut)};
  opacity: ${(props) => (props.style.mode ? 1 : 0)};
`;

const BarHeader = styled.div`
  display: flex;
  justify-content: space-between;
`;

const UpdateList = styled.p`
  margin: 3% 5%;
  font-size: 20px;
`;

export default NavigationBar;
