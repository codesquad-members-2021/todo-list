import styled from "styled-components";
// import IconButton from "../utils/IconButton";
import LogCommit from "./LogCommit";
import { HiX } from "react-icons/hi";

const LogStorageBlock = styled.div`
  position: absolute;
  width: 452px;
  height: 1024px;
  right: -440px;
  top: 0px;
  background: #ffffff;
  box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5), 0px 2px 4px rgba(0, 0, 0, 0.25);
  backdrop-filter: blur(4px);
`;

const IconX = styled.div`
  display: block;
  position: absolute;
  right: 80px;
  top: 50px;
`;

const LogList = styled.div`
  margin-top: 80px;
`;

function LogStorage({ LogStorageDom, setLogViewState }) {
  const handleXbtnClick = (LogStorageDom) => {
    setLogViewState(false);
    LogStorageDom.currentTarget.classList.remove("appear");
  };

  return (
    <>
      <LogStorageBlock className="logStorage appear" ref={LogStorageDom}>
        {/* <IconButton type="delete"></IconButton> */}
        <IconX onClick={handleXbtnClick}>
          <HiX></HiX>
        </IconX>
        <LogList>
          <LogCommit></LogCommit>
        </LogList>
      </LogStorageBlock>
    </>
  );
}
export default LogStorage;
