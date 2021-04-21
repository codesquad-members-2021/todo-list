import Button from '../Button'
import HistoryList from './HistoryList'
import { FaChevronRight } from 'react-icons/fa'
import styled from 'styled-components'

const NavigatorBlock = styled.div`
  z-index: 1;
  top: 0;
  right: 0;
  transform: ${({ toggle }) =>
    toggle ? 'translateX(0)' : 'translateX(+50rem)'};
  width: 25%;
  height: 100%;
  background: white;
  border: 1px solid black;
  display: flex;
  align-items: flex-end;
  flex-direction: column;
  position: absolute;
  box-sizing: border-box;
  padding: 2rem;
  transition: 0.2s ease-out;
  button {
    margin-right: 0.8rem;
    margin-top: 0.9rem;
  }
`


export default function Navigator ({ toggle, onClick }) {
  return (
    <NavigatorBlock toggle={toggle}>
      <Button onClick={onClick}>
        <FaChevronRight />
      </Button>
      <HistoryList />
    </NavigatorBlock>
  )
}
