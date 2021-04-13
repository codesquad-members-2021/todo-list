import styled from "styled-components";
import crong from "./crong.jpg";
import LogMessage from "./LogMessage";

const LogBlock = styled.div`
  display: flex;
  flex-direction: row;
  align-items: flex-start;
  padding: 16px;
  position: static;
  width: 332px;
  height: 137px;
  left: 0px;
  top: 0px;

  background: #ffffff;
  flex: none;
  order: 0;
  flex-grow: 0;
  margin: auto auto;
`;

const UserImg = styled.div`
  width: 30px;
  height: 30px;
  background-image: url(${crong});
  background-size: cover;
  border-radius: 50%;
  margin-right: 10px;
`;

function LogCommit({ logs }) {
  console.log(logs);
  return (
    <>
      {logs.map((log, index) => (
        <LogBlock key={index}>
          <UserImg />@ Crong
          <LogMessage log={log}></LogMessage>
        </LogBlock>
      ))}
    </>
  );
}

export default LogCommit;
