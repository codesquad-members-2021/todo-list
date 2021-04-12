import styled from 'styled-components'
import { FaUserCircle } from 'react-icons/fa'
import HistoryItem from './HistoryItem'
const test = {
  historyList: [
    {
      author: 'eamon',
      text: '<b>정리하기</b> 을(를) <b>해야할 일</b>에 <b>생성</b>하였습니다.',
      time: '1분전'
    },
    {
      author: 'eamon',
      text: '<b>정리하기</b> 을(를) <b>해야할 일</b>에 <b>생성</b>하였습니다.',
      time: '1분전'
    },
    {
      author: 'eamon',
      text: '<b>정리하기</b> 을(를) <b>해야할 일</b>에 <b>생성</b>하였습니다.',
      time: '1분전'
    }
  ]
}
const profile = <FaUserCircle />

export default function HistoryList ({ children }) {
  const HistoryListBlock = styled.ul`
    margin-top: 1rem;
    font-size: 1rem;
    line-height: 1.4;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0;
  `
  //store 에 저장할 로그
  //author
  //text
  //action 이 일어난 시간
  return (
    <HistoryListBlock>
      {test.historyList.map(({ author, text, time }) => (
        <HistoryItem
          author={author}
          text={text}
          time={time}
          profile={profile}
        />
      ))}
    </HistoryListBlock>
  )
}
