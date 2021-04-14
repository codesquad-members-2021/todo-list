import React from 'react';
import styled from "styled-components";
import Image from '../../atoms/Image';
import Span from '../../atoms/Span';
import userIcon from '../../../images/userIcon.png';

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

const HistoryItem = (props) => {

  const { user, userImage, prevTitle, currentTitle,
    action, prevColumn, currentColumn, Date } = props;

  console.log(props)

  return (<WrapDiv>
    <ImgDiv>
      <Image _width="40px" src={userIcon} />
    </ImgDiv>
    <TextDiv>
      <div><Span>@Jake</Span></div>
      <div><Span>해야할 일에 HTML/CSS 공부하기를 등록하였습니다</Span></div>
      <div><Span _fontColor="#777777">1분 전</Span></div>
    </TextDiv>
  </WrapDiv>);
};


export default HistoryItem;
