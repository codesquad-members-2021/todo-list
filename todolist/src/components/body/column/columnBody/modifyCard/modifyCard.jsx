import React from 'react';
import InputTitle from './inputTitle.jsx';
import InputContents from './inputContents.jsx';
// import ModifyCardCancelButton from "../staticCard/modifyCardCancelButton.jsx";
// import RegistButton from "../staticCard/registButton.jsx";

const ModifyCard = () => {
  return (
    <div className="modify-card">
      <InputTitle />
      <InputContents />
      {/* <ModifyCardCancelButton />
      <RegistButton /> */}
    </div>
  );
};

export default ModifyCard;
