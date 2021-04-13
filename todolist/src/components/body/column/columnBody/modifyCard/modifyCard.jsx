import React, { useState } from "react";
import InputTitle from "./inputTitle.jsx";
import InputContents from "./inputContents.jsx";
import ModifyCardCancelButton from "./modifyCardCancelButton.jsx";
import RegistButton from "./registButton.jsx";
import { postData } from "../../../../../utils/axios.js";

const ModifyCard = () => {
  const [buttonFlag, setButtonFlag] = useState(true);

  const handleButtonFlag = ({ target: { value } }) => {
    setButtonFlag(false);
  };

  const postCardData = ({ target }) => {
    // const url = `http://localhost:3002/column?columnTitle=${"ds"}`;
    // postData();
    // console.log("posted!");
    console.log(target.parentNode.parentNode.parentNode);
  };

  return (
    <div className="modify-card">
      <InputTitle handleButtonFlag={handleButtonFlag} />
      <InputContents handleButtonFlag={handleButtonFlag} />
      <ModifyCardCancelButton />
      <RegistButton postCardData={postCardData} buttonFlag={buttonFlag} />
    </div>
  );
};

export default ModifyCard;
