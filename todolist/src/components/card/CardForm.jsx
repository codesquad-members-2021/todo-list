import React, { useState } from "react";

function CardForm(props) {
  const { card } = props;
  const [title, setTitle] = useState(card ? card.title : "");
  const [content, setContent] = useState(card ? card.content : "");

  const onSubmit = (e) => {
    e.preventDefault();
    props.onSubmit({ id: card ? card.id : Date.now(), title, content });
  };

  return (
    <form action="">
      <div className="card-input-section">
        <input className="card-input-title" type="text" placeholder="title" value={title} onChange={(e) => setTitle(e.target.value)} />
        <textarea cols="30" rows="10" placeholder="content" onChange={(e) => setContent(e.target.value)} defaultValue={content}></textarea>
      </div>
      <div className="card-btn-section">
        <button className="btn cancel-btn" onClick={props.onCancel}>
          취소
        </button>
        <button className="btn edit-btn" onClick={onSubmit}>
          등록
        </button>
      </div>
    </form>
  );
}

export default CardForm;
