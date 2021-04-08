import React from "react";
import Span from "../atoms/Span";
import SmallButton from "../../atoms/SmallButton";
import MediumButton from "../../atoms/MediumButton";
import Label from "../atoms/Label";
import Input from "../atoms/Input";



const Title = () => {

  const clickHandler = () => {
    console.log("success");
  }
  const changeHandler = () => {
    console.log("change");
  }

  return (
    <div>
      <Span>To do List</Span>
      <SmallButton onClick={clickHandler}>햄버거</SmallButton>
      <MediumButton onClick={clickHandler}>햄버거</MediumButton>
      <Input onChange={changeHandler} placeholder="입력하세요" />
      <Label>0</Label>
    </div>
  );
};


export default Title;
