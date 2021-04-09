import React from 'react';

const Card = ({cards}) => {
  console.log(cards);
  const cardlists = cards.map(({id, title, content, author}) => {
    return (
      <>
        <li key={id}>
        <h3>{title}</h3>
        <p>{content}</p>
        <span>{author}</span>
        </li>
      </>
    )
  })

  return (
    <div>{cardlists}</div>
  )
}

export default Card;