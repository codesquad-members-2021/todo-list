import React from "react";
import InputTitle from "./inputTitle.jsx";
import InputContents from "./inputContents.jsx";
import ModifyCardCancelButton from "./modifyCardCancelButton.jsx";
import RegistButton from "./registButton.jsx";
import ButtonWrapper from "./buttonWrapper.style.jsx";
import ModifyCardDiv from "./modifyCard.style.jsx";

const ModifyCard = ({ props }) => {
  return (
    <ModifyCardDiv className="modify-card">
      <InputTitle
        handleChangeTItle={props.handleChangeTItle}
        handleButtonFlag={props.handleButtonFlag}
      />
      <InputContents
        handleChangeContents={props.handleChangeContents}
        handleButtonFlag={props.handleButtonFlag}
      />
      <ButtonWrapper>
        <ModifyCardCancelButton
          id={props.id}
          handleAddButtonClick={props.handleAddButtonClick}
        />
        <RegistButton
          id={props.id}
          buttonFlag={props.buttonFlag}
          postCardData={props.postCardData}
        />
      </ButtonWrapper>
    </ModifyCardDiv>
  );
};

export default ModifyCard;
