import React from 'react';
import styled from "styled-components";
import Image from '../../atoms/Image';
import Span from '../../atoms/Span';
import userIcon from '../../../images/userIcon.png';
import historyTemplate from '../../../serviceUtils/historyTemplate';
import { getTimeTaken } from '../../../serviceUtils/dateUtil';

const WrapDiv = styled.div`
  display: flex;
  padding: 15px;
  background:#fff;
`;

const ImgDiv = styled.div`
  margin: 0 10px 0 0;
`;


const TextDiv = styled.div`
  > div {
    margin-bottom:5px;
  }
`;

const HistoryItem = ({ itemObject }) => {

  const { user, userImage, prevTitle, currentTitle,
    action, prevColumn, currentColumn, date } = itemObject;

  const currentTime = Date.now();

  return (
    <WrapDiv>
      <ImgDiv>
        <Image _width="40px" src={userIcon} />
      </ImgDiv>
      <TextDiv>
        <div><Span>@{user}</Span></div>
        <div>
          {historyTemplate[action](itemObject)}
        </div>
        <div><Span _fontColor="#777777">{getTimeTaken(currentTime, date)} 전</Span></div>
      </TextDiv>
    </WrapDiv>);
};


export default HistoryItem;
