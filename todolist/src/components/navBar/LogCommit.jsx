import styled from "styled-components";
import crong from "./crong.jpg";

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

function LogCommit() {
  return (
    <>
      <LogBlock>
        <UserImg />
        dkssud?
      </LogBlock>
      <LogBlock>dkssud?</LogBlock>
      <LogBlock>dkssud?</LogBlock>
    </>
  );
}

export default LogCommit;
