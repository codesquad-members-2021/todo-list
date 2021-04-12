import Button from '../Button'
import HistoryList from './HistoryList'
import { FaChevronRight } from 'react-icons/fa'
import styled from 'styled-components'

export default function Navigator () {
  const NavigatorBlock = styled.div`
    top: 0;
    right: 0;
    width: 25%;
    height: 100%;
    background: white;
    border: 1px solid black;
    display: flex;
    align-items: flex-start;
    flex-direction: column;
    position: absolute;
    box-sizing: border-box;
    padding: 2rem;
  `

  return (
    <NavigatorBlock>
      <Button>
        <FaChevronRight />
      </Button>
      <HistoryList/>
    </NavigatorBlock>
  )
}
