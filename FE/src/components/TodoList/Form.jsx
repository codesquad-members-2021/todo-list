import { useState, useRef, useEffect } from 'react';
import StyledForm from '../atoms/StyledForm';
import { InputTitle, InputContent } from '../atoms/StyledInputs';
import FormButtonsWrap from '../molecules/FormButtonsWrap';

const Form = ({ addCard, column, offDisplay }) => {
  const [inputs, setInputs] = useState({
    title: '',
    content: '',
  });
  const titleInput = useRef();
  const contentInput = useRef();
  const nextID = useRef(5); // 임시 아이디

  const handleSubmit = (e) => {
    e.preventDefault();

    const newCard = {
      id: nextID.current,
      title: titleInput.current.value,
      content: contentInput.current.value,
      author: column.cards.author,
    };

    const cardAdded = [...column.cards, newCard];
    column.cards = cardAdded;
    nextID.current++;
    addCard(column);
    offDisplay();
  };

  const onChange = ({ target }) => {
    setInputs({
      ...inputs,
      [target.name]: target.value,
    });
  };

  const resize = () => {
    const currentHeight = contentInput.current.clientHeight;
    const scrollHeight = contentInput.current.scrollHeight;
    if (currentHeight < scrollHeight) {
      contentInput.current.style.height = `${
        contentInput.current.scrollHeight + 2
      }px`;
    }
  };

  return (
    <StyledForm onSubmit={handleSubmit}>
      <InputTitle
        name="title"
        type="text"
        placeholder="제목을 적어주세요"
        ref={titleInput}
        autoComplete="off"
        onChange={onChange}
      />
      <InputContent
        name="content"
        type="text"
        placeholder="내용을 적어주세요"
        ref={contentInput}
        autoComplete="off"
        onKeyUp={resize}
        onChange={onChange}
      />
      <FormButtonsWrap offDisplay={offDisplay} inputs={inputs} />
    </StyledForm>
  );
};

export default Form;
