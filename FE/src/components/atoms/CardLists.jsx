const CardLists = ({ cards }) => {
  const cardlists = cards.map(({ id, title, content, author }) => {
    return (
      <li key={id + title}>
        <div>
          <h3>{title}</h3>
          <span>icon</span>
        </div>
        <p>{content}</p>
        <span>{author}</span>
      </li>
    );
  });

  return <>{cardlists}</>;
};

export default CardLists;
