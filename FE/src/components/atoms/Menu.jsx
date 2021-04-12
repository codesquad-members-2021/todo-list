import React, {useState} from 'react';
import './Menu.css'
import Sidebar from './../Sidebar/Sidebar'

const Menu = () => {
  const [isClicked, setIsClicked] = useState(false);

  const toggleSidebar = () => {
    setIsClicked(!isClicked);
  }

  return (
    <div>
      <div className="Menu" onClick={toggleSidebar} >
        <i className="fa fa-bars"></i>
      </div>
      <Sidebar isClicked={isClicked} toggleSidebar= {toggleSidebar}/>
    </div>
  );
}

export default Menu;