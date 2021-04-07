import React from 'react';

function Card({list}) {
  return (
    <>
    <div>
      <h2>{list.title}</h2>
      <p>{list.content}</p>
      <p>{list.author}</p>
    </div>
    </>
  );
}

export default Card;