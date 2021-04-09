import React from 'react';
import styled from "styled-components";
import SmallButton from '../../atoms/SmallButton';
import Image from '../../atoms/Image';
import closeButton from '../../../images/closeButton.svg';

const WrapDiv = styled.div`
  position: absolute;
  width: 450px;
  height: 100%;
  padding: 15px;
  background: #fff;
  right: -475px;
`;

const ButtonDiv = styled.div`
  text-align: end;
`;

const HistoryList = ({ children, ...props }) => {
  return (
    <WrapDiv>
      <ButtonDiv>
        <SmallButton>
          <Image _width="20px" src={closeButton} />
        </SmallButton>
      </ButtonDiv>
      <div>
        {children}
      </div>
    </WrapDiv>
  )
}

export default HistoryList;