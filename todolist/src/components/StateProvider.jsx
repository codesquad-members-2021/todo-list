import React, { useState } from "react";
import NavBar from "./navBar/NavBar";
import Board from "./Board";

function StateProvider() {
  const [log, setLog] = useState([
    {
      cardTitle: "HTML/CSS 공부하기",
      columnTitle: "하고 있는 일",
      modeType: "add",
      publishedTime: Date.now(),
      start: true,
    },
  ]);

  const handleLog = ({ cardTitle, columnTitle, modeType, publishedTime }) => {
    setLog(
      log.concat({
        cardTitle,
        columnTitle,
        modeType,
        publishedTime,
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
