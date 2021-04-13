import React, { useState } from 'react'
import Button from '../Button'
import Navigator from './Navigator'
import { FaChevronLeft } from 'react-icons/fa'
import styled from 'styled-components'

const HeadTitleBlock = styled.div`
  width: 100%;
  height: 7rem;
  background: #f5f5f7;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-family: Noto Sans KR;
  font-size: 32px;
  line-height: 46px;
  padding: 0 5rem;
  box-sizing: border-box;
`

export default function HeadTitle ({ children }) {
  const [toggle, setToggle] = useState(false);

  const onClick = () => setToggle(!toggle);

  return (
    <HeadTitleBlock>
      <span>Json-Luke-mon To-do List</span>
      <Button onClick={onClick}>
        <FaChevronLeft />
      </Button>
      <Navigator toggle={toggle} onClick={onClick} />
    </HeadTitleBlock>
  )
}
