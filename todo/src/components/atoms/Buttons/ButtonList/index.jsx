import React from "react";
import Span from "../../Span";
import Image from "../../Image";
import SmallButton from "../SmallButton";
import MediumButton from "../MediumButton";
import PlusButtonImg from "../../../../images/plusButton.svg";
import CloseButtonImg from "../../../../images/closeButton.svg";

const ButtonList = ({ isIcon, toggleActions, patchClickHandler }) => {
  const plusButton = (
    <SmallButton>
      <Image src={PlusButtonImg} _width="23px" />
    </SmallButton>
  );
  const closeButton = (
    <SmallButton>
      <Image src={CloseButtonImg} _width="20px" />
    </SmallButton>
  );
  const cancelButtons = (
    <MediumButton _background="#fff" _color="#3c4243" onClick={() => toggleActions.toggle()}>
      취소
    </MediumButton>
  );
  const enrollButtons = (
    <MediumButton _background="#62afb7" _color="white" onClick={() => patchClickHandler()}>
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
  return <Span>{currentButton}</Span>;
};

export default ButtonList;
