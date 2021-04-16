import { useState } from 'react';
import styled from 'styled-components'
import Button from '../Button';

const CreateColumnBlock = styled.div`
  display: ${({ toggle }) => toggle ? 'block' : 'none'};
  position: fixed;
  z-index: 1;
  padding: 3rem;
  text-align: center;
  width: 300px;
  left: calc(50% - 150px);
  margin: 5vh 0;
  background-color: #000;
  p {
    color: #fff;
  }
  &:before {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0,0,0,0.3);
    z-index: -1;
    content: "";
  }
  & > * {
    width: 100%;
  }
`;

const Input = styled.input.attrs({
  type: 'text'
})`
  padding: 0.5rem;
  font-size: 1rem;
  margin-bottom: 1rem;
`;

const Buttons = styled.div`
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 0.4rem;
  button {
    border-radius: 0.2rem;
    background-color: #bbb;
    padding: 0.4rem 1rem;
    opacity: 0.6;
    &:last-child {
      color: #fff;
      background-color: #ffcc00;
      opacity: ${({ title }) => title !== '' ? 1 : 0.6};
      user-select: ${({ title }) => title !== '' ? 'initial' : 'none'};
      pointer-events: ${({ title }) => title !== '' ? 'initial' : 'none'};
    }
  }
`;

export default function CreateColumn ({toggle, onCreate, onCancel}) {
  const [title, setTitle] = useState("");
  const onChange = ({ target }) => {
    setTitle(target.value);
  }
  return (
    <CreateColumnBlock toggle={toggle}>
      <p>컬럼 생성하기</p>
      <Input value={title} onChange={onChange}/>
      <Buttons title={title}>
        <Button onClick={onCancel}>취소</Button>
        <Button onClick={() => onCreate(title)}>생성</Button>
      </Buttons>
    </CreateColumnBlock>
  );
}
