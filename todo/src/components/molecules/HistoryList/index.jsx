import React from 'react';
import styled from "styled-components";
import SmallButton from '../../atoms/SmallButton';
import Image from '../../atoms/Image';
import HistoryItem from '../HistoryItem';
import closeButton from '../../../images/closeButton.svg';

const WrapDiv = styled.div`
  position: absolute;
  width: 450px;
  height: 100%;
  padding: 15px;
  background: #fff;
  right: ${props => props.isHide ? -480 : 3}px;
  top:3px;
  transition: all 1s;
`;

const ButtonDiv = styled.div`
  margin: 15px 5px 0 0;
  text-align: end;
`;

const HistoryList = ({ children, toggleClickHandler, ...props }) => {
  return (
    <WrapDiv {...props}>
      <ButtonDiv>
        <SmallButton onClick={toggleClickHandler}>
          <Image _width="20px" src={closeButton} />
        </SmallButton>
      </ButtonDiv>
      <div>
        <HistoryItem />
      </div>
    </WrapDiv>
  )
}

export default HistoryList;