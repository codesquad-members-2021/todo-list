import React from 'react';
import { ButtonNormalHover, ButtonNormalHoverText } from '../../../../style/button-normal-hover.jsx';

const ModifyCardCancelButton = () => {
  return (
    <ButtonNormalHover className="modify-card-cancel-button-section">
      <ButtonNormalHoverText className="modify-card-cancel-button">취소</ButtonNormalHoverText>
    </ButtonNormalHover>
  );
};

export default ModifyCardCancelButton;
