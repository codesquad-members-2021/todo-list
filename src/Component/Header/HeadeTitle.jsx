import Button from '../Button'
import styled from 'styled-components'

export default function HeadTitle () {
  const onClick = () => {}

  const HeadTitleBlock = styled.div`
    width: 100%;
    height: 112px;
    left: 0px;
    top: 0px;
    background: #f5f5f7;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-family: Noto Sans KR;
    font-size: 32px;
    line-height: 46px;
    padding:0 5rem;
    box-sizing: border-box;
  `

  return (
    <HeadTitleBlock>
      <span>Json-Luke-mon To-do List</span>
      <Button text={'햄버거'} onClick={onClick} />
    </HeadTitleBlock>
  )
}
