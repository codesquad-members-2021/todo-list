import React from "react";
import styled from "styled-components";
import Span from "../../Span";
import Image from "../../Image";
import SmallButton from "../SmallButton";
import MediumButton from "../MediumButton";
import PlusButtonImg from "../../../../images/plusButton.svg";
import CloseButtonImg from "../../../../images/closeButton.svg";

const Div = styled.div`
  padding: 10px 45px 0px 45px;
`;
const ButtonList = ({
  isIcon,
  toggleActions2,
  toggleActions,
  patchClickHandler,
  ...props
}) => {
  const plusButton = (
    <SmallButton onClick={props.addTodo}>
      <Image id="plusBtn" src={PlusButtonImg} _width="23px" />
    </SmallButton>
  );
  const closeButton = (
    <SmallButton>
      <Image id="closeBtn" src={CloseButtonImg} _width="20px" />
    </SmallButton>
  );
  const cancelButtons = (
    <MediumButton
      _background="#fff"
      _color="#3c4243"
      onClick={() => {
        if (toggleActions) return toggleActions.toggle();
        toggleActions2.toggle();
      }}
    >
      취소
    </MediumButton>
  );
  const enrollButtons = (
    <MediumButton
      _background="#62afb7"
      _color="white"
      onClick={async () => {
        await patchClickHandler();
        toggleActions2.toggle();
      }}
    >
      등록
    </MediumButton>
  );
  const currentButton = isIcon ? (
    <>
      {plusButton}
      {closeButton}
    </>
  ) : (
    <>
      {cancelButtons}
      {enrollButtons}
    </>
  );
  return <Div>{currentButton}</Div>;
};

export default ButtonList;
