import React from "react";
import InputTitle from "./inputTitle.jsx";
import InputContents from "./inputContents.jsx";
import ModifyCardCancelButton from "./modifyCardCancelButton.jsx";
import RegistButton from "./registButton.jsx";

const ModifyCard = () => {
  return (
    <div className="modify-card">
      <InputTitle />
      <InputContents />
      <ModifyCardCancelButton />
      <RegistButton />
    </div>
  );
};

export default ModifyCard;
