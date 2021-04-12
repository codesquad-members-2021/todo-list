import { useRef } from 'react';
import StyledForm from '../atoms/StyledForm';
import { InputTitle, InputContent } from '../atoms/StyledInputs';
import FormButtonsWrap from '../molecules/FormButtonsWrap';

const Form = ({ addCard, column, handleClickCancel }) => {
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

  const NewForm = () => (
    <StyledForm onSubmit={handleSubmit}>
      <InputTitle
        name="title"
        type="text"
        placeholder="제목을 적어주세요"
        ref={titleInput}
        autoComplete="off"
      />
      <InputContent
        name="content"
        type="text"
        placeholder="내용을 적어주세요"
        ref={contentInput}
        autoComplete="off"
        onKeyUp={resize}
      />
      <FormButtonsWrap handleClickCancel={handleClickCancel} />
    </StyledForm>
  );
  return <NewForm />;
};

export default Form;
