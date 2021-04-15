import CardWrap from "./CardWrap";

function CardList({ cards, onDelete, onUpdate, columns }) {
  return (
    <ul>
      {cards.map((card) => (
        <CardWrap key={card.cardId} card={card} onDelete={onDelete} onUpdate={onUpdate} />
      ))}
    </ul>
  );
}

export default CardList;
