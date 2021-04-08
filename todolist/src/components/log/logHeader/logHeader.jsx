import React from "react";
import LogTitle from "./logTitle.jsx";
import LogHideButton from "./logHideButton.jsx";

const LogHeader = () => {
  return (
    <div className="log-header">
      <LogTitle />
      <LogHideButton />
    </div>
  );
};

export default LogHeader;
