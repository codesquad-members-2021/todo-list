import Card from './Card';

const CardLists = ({
  column,
  cards,
  checkInputValue,
  SetIsDeleteBtnClicked,
  setNewColumns,
}) => {
  const cardlists = [...cards]
    .reverse()
    .map((cards) => (
      <Card
        key={cards.id}
        cards={cards}
        checkInputValue={checkInputValue}
        column={column}
        SetIsDeleteBtnClicked={SetIsDeleteBtnClicked}
        setNewColumns={setNewColumns}
      />
    ));
  return <>{cardlists}</>;
};
export default CardLists;
