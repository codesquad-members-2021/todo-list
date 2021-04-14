import styled from 'styled-components'
import { FaUserCircle } from 'react-icons/fa'
import HistoryItem from './HistoryItem'
import { useHistoyState } from '../Context'
let test = [
  {
    text: '<b>정리하기</b> 을(를) <b>해야할 일</b>에 <b>생성</b>하였습니다.',
    time: '1분전'
  },
  {
    text: '<b>정리하기</b> 을(를) <b>해야할 일</b>에 <b>생성</b>하였습니다.',
    time: '1분전'
  },
  {
    text: '<b>정리하기</b> 을(를) <b>해야할 일</b>에 <b>생성</b>하였습니다.',
    time: '1분전'
  }
]

const profile = <FaUserCircle />
const HistoryListBlock = styled.ul`
  margin-top: 1rem;
  font-size: 1rem;
  line-height: 1.4;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0;
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
  console.log(useHistoyState())
  localStorage.setItem('historyList', JSON.stringify(useHistoyState()))
  HistoryItems = useHistoyState().map(
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
