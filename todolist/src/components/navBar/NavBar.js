import styled from "styled-components";
import { HiMenu } from "react-icons/hi";
import { useState, useRef } from "react";
import LogStorage from "./LogStorage";

const NavBlock = styled.div`
  width: 1440px;
  height: 112px;
  left: 0px;
  top: 0px;
  display: flex;
  justify-content: space-around;
`;
const TitleBlock = styled.div`
  position: absolute;
  width: 200px;
  height: 46px;
  left: 80px;
  top: 33px;

  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: normal;
  font-size: 32px;
  line-height: 46px;

  /* Black */

  color: #010101;
`;

const LogBtnBlock = styled.div`
  width: 34px;
  height: 22px;
  position: absolute;
  right: 84px;
  top: 40px;
`;

function NavBar() {
  const LogStorageDom = useRef();
  const [appear, setLogViewState] = useState(false);

  const handleLogBtnClick = () => {
    setLogViewState(true); //바로 값이 바뀌지는 않는다.
    if (appear) LogStorageDom.current.classList.add("appear");
  };

  return (
    <>
      <NavBlock>
        <TitleBlock>TO-DO LIST</TitleBlock>
        <LogBtnBlock>
          <HiMenu className="icon" onClick={handleLogBtnClick} />
        </LogBtnBlock>
      </NavBlock>
      <LogStorage logDom={LogStorageDom}></LogStorage>
    </>
  );
}

export default NavBar;
