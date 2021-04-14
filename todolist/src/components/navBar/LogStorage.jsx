import styled, { css, keyframes } from "styled-components";
import Button from "../utils/Button";
import LogCommit from "./LogCommit";

const slideOut = keyframes`
from{
  transform: translateX(1150px)
}to{
  transform: translateX(2000px)}
`;

const slideIn = keyframes`
from{
  transform: translateX(2000px)
}to{
  transform: translateX(1150px)
}`;
// 초기 : width 0
const LogStorageBlock = styled.div`
  position: absolute;
  width: 452px;
  height: 1024px;
  top: 0px;
  background: #ffffff;
  box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5),
    0px 2px 4px rgba(0, 0, 0, 0.25);
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

const IconX = styled.div`
  display: block;
  position: absolute;
  right: 120px;
  top: 50px;
`;

const LogList = styled.div`
  margin-top: 80px;
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
          <LogList>
            <LogCommit logs={logs}></LogCommit>
          </LogList>
        </LogStorageBlock>
      )}
    </>
  );
}
export default LogStorage;
