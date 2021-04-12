import React from 'react';
import styled from 'styled-components';
import { ReactComponent as cardDeleteBtn } from '../../../../style/deleteIcon.svg';

const CardDeleteBtn = styled(cardDeleteBtn)`
  width: 13.79px
  height: 13.79px
	background: #828282;
`;

const CardDeleteButton = () => {
  return <CardDeleteBtn className="card-delete-button" />;
};

export default CardDeleteButton;
