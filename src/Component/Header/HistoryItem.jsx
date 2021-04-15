// import Button from '../Button'
// import { FaTimes } from 'react-icons/fa'
import React, { useEffect, useState } from 'react'
import styled from 'styled-components'
import { useTodoUserNameContext } from '../Context'
const HistoryItemBlock = styled.li`
  margin-top: 1rem;
  border: 1px solid black;
  padding: 0.5rem 0;
  display: flex;
`
const HistoryItemTextBlock = styled.div`
  div {
    margin-bottom: 0.4rem;
  }
  padding: 0 0.5rem;
`

const HistoryItemProfileBlock = styled.div`
  display: flex;
  align-items: center;
  padding: 0 0.6rem;
  font-size: 2.8rem;
`

const Id = styled.div`
  font-size: 0.8rem;
`

const Contents = styled.div`
  font-size: 0.8rem;
`

const Time = styled.div`
  font-size: 0.7rem;
  color: gray;
`

export default function HistoryItem ({ author, text, time, profile }) {
  const [stateTime, SetTime] = useState(new Date() - new Date(time))
  useEffect(() => {
    const interval = setInterval(() => {
      SetTime(Math.ceil((new Date() - new Date(time)) / 600000))
      console.log('This will run every second!')
    }, 1000)
    return () => clearInterval(interval)
  }, [time])

  return (
    <HistoryItemBlock>
      <HistoryItemProfileBlock>{profile}</HistoryItemProfileBlock>
      <HistoryItemTextBlock>
        <Id>@{useTodoUserNameContext().current}</Id>
        <Contents dangerouslySetInnerHTML={{ __html: text }}></Contents>
        <Time>{stateTime + '분 전'}</Time>
      </HistoryItemTextBlock>
    </HistoryItemBlock>
  )
}
