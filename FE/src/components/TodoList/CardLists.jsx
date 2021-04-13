import { useState } from 'react';
import styled from 'styled-components';
import { InputTitle, InputContent } from '../atoms/StyledInputs';

const CardLists = ({ cards }) => {
  const [inputs, setInputs] = useState({
    title: '',
    content: '',
  });

  const handleClickCard = () => {
    console.log('clicked');
  };
  const cardlists = cards.map((cards) => {
    const { id, title, content, author } = cards;
    return (
      <CardContainer key={id + title}>
        <li>
          <div onDoubleClick={handleClickCard}>
            <CardTitleInput value={title} readOnly={true} />
            <CardContentTextArea value={content} readOnly={true} />
          </div>
          <span>{author}</span>
        </li>
      </CardContainer>
    );
  });

  return <>{cardlists}</>;
};
export default CardLists;

const CardContainer = styled.div`
  margin-bottom: 1rem;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  margin-bottom: 1rem;
  padding: 16px;
  width: 308px;
  height: auto;
  background: #ffffff;
  box-sizing: border-box;
  box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
  border-radius: 6px;
  border: 0;
`;
const CardTitleInput = styled(InputTitle)``;
const CardContentTextArea = styled(InputContent)``;
