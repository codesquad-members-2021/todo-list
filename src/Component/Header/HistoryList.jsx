import styled from 'styled-components'
import { FaUserCircle } from 'react-icons/fa'
import HistoryItem from './HistoryItem'

let test = [
  {
    id: 1,
    author: 'eamon',
    text: '<b>정리하기</b> 을(를) <b>해야할 일</b>에 <b>생성</b>하였습니다.',
    time: '1분전'
  },
  {
    id: 2,
    author: 'eamon',
    text: '<b>정리하기</b> 을(를) <b>해야할 일</b>에 <b>생성</b>하였습니다.',
    time: '1분전'
  },
  {
    id: 3,
    author: 'eamon',
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
localStorage.setItem('historyList', JSON.stringify(test))

const HistoryItems = JSON.parse(localStorage.getItem('historyList')).map(({ author, text, time, id }) => (
  <HistoryItem
    author={author}
    text={text}
    time={time}
    key={id}
    profile={profile}
  />
));

export default function HistoryList ({ children }) {
  return <HistoryListBlock>{HistoryItems}</HistoryListBlock>
}
