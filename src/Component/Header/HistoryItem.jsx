import Button from '../Button'
import { FaTimes } from 'react-icons/fa'
import styled from 'styled-components'

export default function HistoryItem ({ author, text, time, profile }) {
  const HistoryItemBlock = styled.li`
    margin-top: 1rem;
    border: 1px solid black;
    padding: 0.5rem 0;
    display: flex;

  `
  const HistoryItemtTextBlock = styled.div`
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

  return (
    <HistoryItemBlock>
    
      <HistoryItemProfileBlock>{profile}</HistoryItemProfileBlock>
      <HistoryItemtTextBlock>
        <div>@{author}</div>
        <div dangerouslySetInnerHTML={{ __html: text }}></div>
        <div>{time}</div>
      </HistoryItemtTextBlock>
    </HistoryItemBlock>
  )
}
