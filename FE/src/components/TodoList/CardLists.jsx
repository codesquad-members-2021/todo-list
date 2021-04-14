import Card from './Card';

const CardLists = ({ cards, inputs, onChange, checkInputValue, hasInput }) => {
  const cardlists = cards.map((cards) => (
    <Card
      key={cards.id}
      cards={cards}
      onChange={onChange}
      inputs={inputs}
      checkInputValue={checkInputValue}
      hasInput={hasInput}
    />
  ));

  return <>{cardlists}</>;
};
export default CardLists;
