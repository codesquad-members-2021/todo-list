import React from "react";
import styled from "styled-components";
import { ReactComponent as addCardBtn } from "../../../style/addIcon.svg";

const AddCardBtn = styled(addCardBtn)`
  width: 13.79px
  height: 13.79px
`;

const AddCardButton = ({ id, handleCardAddedColumn }) => {
  return (
    <div className="add-card-button-section">
      <AddCardBtn
        onClick={handleCardAddedColumn}
        id={id}
        className="add-card-button"
      />
    </div>
  );
};

export default AddCardButton;
