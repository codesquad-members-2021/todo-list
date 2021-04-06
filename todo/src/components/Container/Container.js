import React from 'react'
import './Container.scss';
import plusButton from './plusButton.svg';
import cancelButton from './cancelButton.svg';


const Container = () => {
  return (
    <div className="Container">
      <div className="todo-wrap">
        <div className="todo-wrap__title">
          <span className="todo-wrap__title__text">해야할 일</span>
          <span className="todo-wrap__title__count">10</span>
          <img className="todo-wrap__title__add-button" src={plusButton} alt="" />
          <img className="todo-wrap__title__cancel-button" src={cancelButton} alt="" />
        </div>
      </div>

      <div className="todo-wrap">
        <div className="todo-wrap__title">
          <span className="todo-wrap__title__text">하고 있는 일</span>
          <span className="todo-wrap__title__count">10</span>
          <img className="todo-wrap__title__add-button" src={plusButton} alt="" />
          <img className="todo-wrap__title__cancel-button" src={cancelButton} alt="" />
        </div>
      </div>

      <div className="todo-wrap">
        <div className="todo-wrap__title">
          <span className="todo-wrap__title__text">완료한 일</span>
          <span className="todo-wrap__title__count">10</span>
          <img className="todo-wrap__title__add-button" src={plusButton} alt="" />
          <img className="todo-wrap__title__cancel-button" src={cancelButton} alt="" />
        </div>
      </div>
    </div>
  )
}

export default Container;