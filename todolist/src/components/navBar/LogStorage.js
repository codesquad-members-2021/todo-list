import styled from "styled-components";
import { HiX } from "react-icons/hi";

const LogStorageBlock = styled.div`
  position: absolute;
  width: 452px;
  height: 1024px;
  right: -440px;
  top: 0px;
  background: #ffffff;
  box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5),
    0px 2px 4px rgba(0, 0, 0, 0.25);
  backdrop-filter: blur(4px);
`;

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

  background: #b48484;

  flex: none;
  order: 0;
  flex-grow: 0;
  margin: auto auto;
`;

const iconX = styled.div`
  position: absolute;
  right: 80px;
  top: 50px;
  
`;

function LogStorage({ LogStorageDom }) {
  return (
    <>
      <LogStorageBlock className="logStorage appear" ref={LogStorageDom}>
        <iconX>
          <HiX></HiX>
        </iconX>
        <LogBlock>dkssud?</LogBlock>
        <LogBlock>dkssud?</LogBlock>
        <LogBlock>dkssud?</LogBlock>
      </LogStorageBlock>
      ;
    </>
  );
}

export default LogStorage;
