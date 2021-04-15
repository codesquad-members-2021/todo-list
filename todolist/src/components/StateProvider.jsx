import React, { useState } from "react";
import NavBar from "./navBar/NavBar";
import Board from "./Board";

function StateProvider() {
  const [log, setLog] = useState([
    {
      cardTitle: "HTML/CSS 공부하기",
      columnTitle: "하고 있는 일",
      modeType: "add",
    },
  ]);

  const handleLog = ({ cardTitle, columnTitle, modeType }) => {
    setLog(
      log.concat({
        cardTitle,
        columnTitle,
        modeType,
      })
    );
  };

  return (
    <>
      <NavBar logs={log} />
      <Board onLog={handleLog} />
    </>
  );
}

export default StateProvider;
