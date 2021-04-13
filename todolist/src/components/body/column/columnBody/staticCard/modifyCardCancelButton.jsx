import React from 'react';
import { ButtonAccent, ButtonAccentText } from '../../../../style/button-accent.jsx';

const ModifyCardCancelButton = () => {
  return (
    <ButtonAccent className="modify-card-cancel-button-section">
      <ButtonAccentText className="modify-card-cancel-button">취소</ButtonAccentText>
    </ButtonAccent>
  );
};

export default ModifyCardCancelButton;
