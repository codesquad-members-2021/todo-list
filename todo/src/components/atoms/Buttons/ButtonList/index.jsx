import React from "react";
import styled from "styled-components";
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
  enrollClickHandler,
  isPatch,
  ...props
}) => {
  const plusButton = (
    <SmallButton onClick={props.addTodo} columnId={props.columnId}>
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
        await enrollClickHandler(isPatch);
        toggleActions2.toggle();
      }}
    >
      등록
    </MediumButton>
  );
  const popCancelButton = (
    <MediumButton
      _background="#fff"
      _color="#3c4243"
      // onClick={() => patchClickHandler()}
    >
      취소
    </MediumButton>
  );
  const popEnrollButton = (
    <MediumButton
      _background="#62afb7"
      _color="white"
      // onClick={() => patchClickHandler()}
    >
      확인
    </MediumButton>
  );
  let currentButton;
  if (isIcon === "small") {
    currentButton = (
      <>
        {plusButton}
        {closeButton}
      </>
    );
  } else if (isIcon === "popup") {
    currentButton = (
      <>
        {popCancelButton}
        {popEnrollButton}
      </>
    );
  } else {
    currentButton = (
      <>
        {cancelButtons}
        {enrollButtons}
      </>
    );
  }

  return <Div>{currentButton}</Div>;
};

export default ButtonList;
