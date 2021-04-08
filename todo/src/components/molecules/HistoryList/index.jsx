import React from 'react';
import styled from "styled-components";
import SmallButton from '../../atoms/SmallButton';
import Image from '../../atoms/Image';
import cancelButton from '../../../images/cancelButton.svg';

const WrapDiv = styled.div`
  position: absolute;
  /* right: -475px; */
  width: 450px;
  height: 100%;
  padding: 15px;
  background: #fff;
`;

const ButtonDiv = styled.div`
  text-align: end;
`;

const HistoryList = ({ children, ...props }) => {
  return (
    <WrapDiv>
      <ButtonDiv>
        <SmallButton>
          <Image imgWidth="20px" src={cancelButton} />
        </SmallButton>
      </ButtonDiv>
      <div>
        {children}
      </div>
    </WrapDiv>
  )
}

export default HistoryList;