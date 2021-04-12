import styled from 'styled-components'

export default function HistoryList ({ children }) {
  const HistoryListBlock = styled.ul`
    margin-top: 1rem;
    border: 1px solid black;
  `

  return <HistoryListBlock>{children}</HistoryListBlock>
}
