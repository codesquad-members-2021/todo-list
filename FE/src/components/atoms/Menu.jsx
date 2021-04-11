import React from 'react';
import './Menu.css'

const Menu =() => {

  const toggleSidebar = () => {
    console.log("menu popup");
  }

  return (
    <div className="Menu" onClick={toggleSidebar} >
       <i className="fa fa-bars"></i>
    </div>
  );
}

export default Menu;