import styled, { css, keyframes } from "styled-components";
import Button from "../utils/Button";
import LogCommit from "./LogCommit";

function LogStorage({ logs, appear, setLogViewState, setClickState }) {
  const handleXbtnClick = () => {
    setLogViewState(false);
    setTimeout(() => {
      setClickState(false);
    }, 800);
  };

  return (
    <LogStorageBlock appear={appear}>
      <ButtonWrapper>
        <Button type="delete" onClick={handleXbtnClick} />
      </ButtonWrapper>
      <LogCommit appear={appear} logs={logs}></LogCommit>
    </LogStorageBlock>
  );
}

const slideOut = keyframes`
from{
  transform: translateX(0px);
}to{
  transform: translateX(100%);
}`;

const slideIn = keyframes`
from{
  transform: translateX(100%);
}to{
  transform: translateX(0px);
}`;

const LogStorageBlock = styled.div`
  position: absolute;
  width: 400px;
  height: 100%;
  top: 0px;
  right: 0px;
  background: #ffffff;
  box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5), 0px 2px 4px rgba(0, 0, 0, 0.25);
  backdrop-filter: blur(4px);
  animation-name: ${slideOut};
  animation-duration: 0.8s;
  animation-timing-function: ease-out;
  animation-fill-mode: forwards;
  ${(props) =>
    props.appear &&
    css`
      animation-name: ${slideIn};
    `};
  overflow: auto;
  &::-webkit-scrollbar {
    width: 10px;
    background-color: black;
    padding-right: 10px;
  }
  &::-webkit-scrollbar-thumb {
    background-color: #0075de;
    border-radius: 5px;
  }
  &::-webkit-scrollbar-track {
    background-color: #e9ecef;
    box-shadow: inset 0px 0px 5px white;
  }
`;
const ButtonWrapper = styled.div`
  margin-top: 45px;
  margin-left: 72%;
`;

export default LogStorage;
