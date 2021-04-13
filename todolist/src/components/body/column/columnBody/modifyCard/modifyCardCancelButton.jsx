import React from "react";
import {
  ButtonNormal,
  ButtonNormalText,
} from "../../../../style/button-normal.jsx";

const ModifyCardCancelButton = (props) => {
  return (
    <div
      id={props.id}
      onClick={props.handleAddButtonClick}
      className="modify-card-cancel-button-section"
    >
      <ButtonNormal id={props.id} className="modify-card-cancel-button">
        <ButtonNormalText id={props.id}>취소</ButtonNormalText>
      </ButtonNormal>
    </div>
  );
};

export default ModifyCardCancelButton;
