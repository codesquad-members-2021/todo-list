import Card from './Card';

const CardLists = ({
  column,
  cards,
  inputs,
  onChange,
  checkInputValue,
  hasInput,
  deleteCard,
}) => {
  const cardlists = cards.map((cards) => (
    <Card
      key={cards.id}
      cards={cards}
      onChange={onChange}
      inputs={inputs}
      checkInputValue={checkInputValue}
      hasInput={hasInput}
      column={column}
      deleteCard={deleteCard}
    />
  ));

  return <>{cardlists}</>;
};
export default CardLists;
