import styled, { css, keyframes } from "styled-components";
import Button from "../utils/Button";
import LogCommit from "./LogCommit";

const slideOut = keyframes`
from{
  transform: translateX(0px);
}to{
  transform: translateX(100%);
`;

const slideIn = keyframes`
from{
  transform: translateX(100%);
}to{
  transform: translateX(0px);
}`;

const LogStorageBlock = styled.div`
  position: absolute;
  width: 452px;
  height: 1024px;
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
`;

function LogStorage({ clicked, logs, appear, setLogViewState }) {
  const handleXbtnClick = () => {
    setLogViewState(false);
  };
  return (
    <>
      {clicked && (
        <LogStorageBlock appear={appear}>
          <Button type="delete" onClick={handleXbtnClick} />

          <LogCommit appear={appear} logs={logs}></LogCommit>
        </LogStorageBlock>
      )}
    </>
  );
}
export default LogStorage;
