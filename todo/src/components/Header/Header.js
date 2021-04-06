import React from 'react';
import buttonImg from './hambergerButtonIcon.png';
import './Header.scss';

const Header = () => {
  return (
    <div className="Header">
      <h1 className="Header__title">TO-DO LIST</h1>
      <img className="Header__button-image" src={buttonImg} alt="" />
    </div>
  )
}

export default Header;