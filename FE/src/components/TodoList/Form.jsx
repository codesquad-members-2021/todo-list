import { useState, useRef, useEffect } from 'react';
import StyledForm from '../atoms/StyledForm';
import { InputTitle, InputContent } from '../atoms/StyledInputs';
import FormButtonsWrap from '../molecules/FormButtonsWrap';

const Form = ({ addCard, column, offDisplay, onChange, inputs }) => {
  const [hasInput, setHasInput] = useState(false);
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

  const resize = () => {
    const currentHeight = contentInput.current.clientHeight;
    const scrollHeight = contentInput.current.scrollHeight;
    if (currentHeight < scrollHeight) {
      contentInput.current.style.height = `${
        contentInput.current.scrollHeight + 2
      }px`;
    }
  };

  const checkInputValue = ({ title, content }) => {
    if (title.length > 0 || content.length > 0) setHasInput(true);
    else setHasInput(false);
  };

  useEffect(() => {
    checkInputValue(inputs);
  }, [inputs]);

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
      <FormButtonsWrap offDisplay={offDisplay} hasInput={hasInput} />
    </StyledForm>
  );
};

export default Form;
