import React, { useState } from "react";
import Header from "./components/header/header.jsx";
import Body from "./components/body/body.jsx";
import Log from "./components/log/log.jsx";
import { ReactComponent as menuBtn } from "./components/header/showLogButton.svg";
import styled from "styled-components";

import "./style.scss";
import "./reset.scss";

const MenuBtn = styled(menuBtn)`
  position: absolute;
  width: 24px;
  height: 24px;
  left: 1200px;
  top: 44px;
`;

const App = () => {
  const [show, setShow] = useState(true);
  return (
    <div className="App">
      <Header />
      <Body />
      {show ? <Log /> : null}
      <MenuBtn className="show-log-button" onClick={() => setShow(!show)} />
    </div>
  );
};

export default App;
