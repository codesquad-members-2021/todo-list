import CardWrap from "./CardWrap";

function CardList(props) {
  const { cards, onDelete, onUpdate } = props;
  return (
    <ul className="card-wrap">
      {cards.map((card) => (
        <CardWrap key={card.id} card={card} onDelete={onDelete} onUpdate={onUpdate} />
      ))}
    </ul>
  );
}

export default CardList;
