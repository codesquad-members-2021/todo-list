import React from "react";
import styled, { keyframes } from "styled-components";

export default function TodoCard({ mode, title, author, age }) {
  // 여기로 프롭스를 받아서 map 으로 리턴.
  return (
    <Box>
      <div>{title}</div>
      <div>{author}</div>
      <div>{age}</div>
    </Box>
  );
}

const Box = styled.div`
  border: 1px solid black;
  margin: 1% 1%;
`;
