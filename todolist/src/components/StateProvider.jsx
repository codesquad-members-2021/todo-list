import React, { useState } from "react";
import NavBar from "./navBar/NavBar";
import Column from "./column/Column";

function StateProvider(props) {
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
      <NavBar log={log} />
      <Column onLog={handleLog} />
    </>
  );
}

export default StateProvider;
