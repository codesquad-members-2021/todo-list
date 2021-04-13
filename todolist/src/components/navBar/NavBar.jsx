import styled from "styled-components";
import { HiMenu } from "react-icons/hi";
import { useState, useRef } from "react";
import LogStorage from "./LogStorage";
// import IconButton from "../utils/IconButton";

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
  color: #010101;
`;
const LogBtnBlock = styled.div`
  width: 34px;
  height: 22px;
  position: absolute;
  right: 84px;
  top: 40px;
`;

function NavBar(props) {
  const { log } = props;
  console.log(log);
  // 잘 찍히는거 확인
  const LogStorageDom = useRef();
  const [appear, setLogViewState] = useState(false);
  const handleLogBtnClick = (LogStorageDom) => {
    setLogViewState(true);
    if (appear) LogStorageDom.current.classList.add("appear");
  };
  return (
    <>
      <NavBlock>
        <TitleBlock>TO-DO LIST</TitleBlock>
        <LogBtnBlock>
          {/* <IconButton type="menu" cb={handleLogBtnClick} size="60" /> */}
          <HiMenu className="icon" onClick={handleLogBtnClick} />
        </LogBtnBlock>
      </NavBlock>
      {appear && <LogStorage ref={LogStorageDom} setLogViewState={setLogViewState}></LogStorage>}
    </>
  );
}

export default NavBar;
