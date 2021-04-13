import { useState } from 'react';
import './Menu.css';
import Sidebar from './../Sidebar/Sidebar';

const Menu = () => {
  const [isClicked, setIsClicked] = useState(false);
  const [transitionFrom, setTransitionFrom] = useState(120);
  const [transitionTo, setTransitionTo] = useState(120);
  const [visible, setVisible] = useState('none');

  const toggleSidebar = () => {
    setIsClicked(!isClicked);
    if (isClicked) {
      setTransitionFrom(-380);
      setTransitionTo(120);
      setTimeout(() => setVisible('none'), 300);
    } else {
      setTransitionFrom(120);
      setTransitionTo(-380);
      setVisible('inline-block');
    }
  };

  return (
    <div>
      <div className="Menu" onClick={toggleSidebar}>
        <i className="fa fa-bars"></i>
      </div>
      <Sidebar
        isClicked={isClicked}
        toggleSidebar={toggleSidebar}
        transitionFrom={transitionFrom}
        transitionTo={transitionTo}
        visible={visible}
      />
    </div>
  );
};

export default Menu;
