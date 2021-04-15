import styled from 'styled-components'
import { FaUserCircle } from 'react-icons/fa'
import HistoryItem from './HistoryItem'
import { useHistoyState } from '../Context'

const profile = <FaUserCircle />
const HistoryListBlock = styled.ul`
  margin-top: 1rem;
  font-size: 1rem;
  line-height: 1.4;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0;
  max-height: 80vh;
  overflow-y: auto;
  padding-right: 1rem;
  &::-webkit-scrollbar {
    width: 0.5rem;
  }
  &::-webkit-scrollbar-thumb {
    background-color: #999;
  }
  &::-webkit-scrollbar-track {
    background-color: #eee;
  }
`


let HistoryItems = JSON.parse(localStorage.getItem('historyList')).map(
  
  ({  text, time }, i) => (
    <HistoryItem
      text={text}
      time={time}
      key={i}
      profile={profile}
    />
  )
)

export default function HistoryList ({ children }) {
  localStorage.setItem('historyList', JSON.stringify(useHistoyState()))
  HistoryItems = useHistoyState().reverse().map(
    ({  text, time }, i) => (
      <HistoryItem
        text={text}
        time={time}
        key={i}
        profile={profile}
      />
    ))
  return <HistoryListBlock>{HistoryItems}</HistoryListBlock>
}
