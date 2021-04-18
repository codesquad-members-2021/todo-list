import React from "react";
import styled from "styled-components";
import SmallButton from "../../atoms/Buttons/SmallButton";
import Image from "../../atoms/Image";
import closeButton from "../../../images/closeButton.svg";
import HistoryItem from "../../molecules/HistoryItem";

const WrapDiv = styled.div`
  overflow: auto;
  position: absolute;
  width: 450px;
  height: 100%;
  padding: 15px;
  background: #fff;
  right: ${(props) => (props.isOpen ? 3 : -480)}px;
  top: 3px;
  transition: all 1s;
  z-index: 1;
`;

const ButtonDiv = styled.div`
  margin: 15px 5px 0 0;
  text-align: end;
`;

const HistoryList = ({ histories, isOpenActions, isOpen }) => {
  return (
    <WrapDiv isOpen={isOpen}>
      <ButtonDiv>
        <SmallButton onClick={isOpenActions.toggle}>
          <Image _width="20px" src={closeButton} />
        </SmallButton>
      </ButtonDiv>

      <div>
        {histories.map(({ id, ...itemObject }) => (
          <HistoryItem key={id} itemObject={itemObject} />
        ))}
      </div>
    </WrapDiv>
  );
};

export default HistoryList;
