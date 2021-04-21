import React, { useState } from 'react'
import Button from '../Button'
import Navigator from './Navigator'
import { FaChevronLeft } from 'react-icons/fa'
import styled from 'styled-components'

const HeadTitleBlock = styled.div`
  width: 100%;
  height: 7rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-family: Noto Sans KR;
  font-size: 2rem;
  padding: 0 3rem;
  box-sizing: border-box;
  span {
    display: flex;
    button {
      padding: 0.5rem;
      margin-left: 3rem;
      border: 1px solid #333;
      background: #fff;
      font-size: 1rem;
      transition: transform 0.15s linear, box-shadow 0.15s linear;
      box-shadow: 2px 2px 2px #333;
      &:active {
        transform: translate(1px, 1px);
        box-shadow: 1px 1px 1px #333;
      }
    }
  }
`

export default function HeadTitle ({ children, onPopupToggleButtonClick, onPopupToggleButtonClickB }) {
  const [toggle, setToggle] = useState(false);
  const onClick = () => setToggle(!toggle);
  return (
    <HeadTitleBlock>
      <span>
        Json-Luke-mon To-do List
        <Button onClick={onPopupToggleButtonClickB}>
          컬럼 추가
        </Button>
        <Button onClick={onPopupToggleButtonClick}>
          닉네임 변경
        </Button>
      </span>
      <Button onClick={onClick}>
        <FaChevronLeft />
      </Button>
      <Navigator toggle={toggle} onClick={onClick} />
    </HeadTitleBlock>
  );
}
