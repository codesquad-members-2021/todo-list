import React, { useEffect, useState } from 'react';
import Close from './Close';
import LogList from './LogList';
import { SidebarContainer, CloseContainer, LogContainer } from './sidebarStyle'
import { useSpring, animated } from 'react-spring';

const Sidebar = ({isClicked, toggleSidebar, transitionFrom, transitionTo, visible}) => {
  const [logArray, setLogArray] = useState();



  useEffect(() => {
    const url = "http://localhost:3000/logData.json";
    fetchData(url, setLogArray);
    
  }, []);

  const fetchData = async (url, callback) => {
    const response = await fetch(url);
    const data = await response.json();
    callback(data);
  }

  const spring = useSpring({
    from: {
      transform: `translate(${transitionFrom}px)`,
      display: visible
    },
    to: {
      transform: `translate(${transitionTo}px)`,
      display: visible
    },
    config: {
      mass: 1
    },
  });


                                        // inline-block <-> none
  return (
    <animated.div style={{ ...spring}}>  
      <SidebarContainer>
        <CloseContainer>
          <Close toggleSidebar = {toggleSidebar}/>
        </CloseContainer>
        <LogContainer>
          <LogList logArray={logArray} />
        </LogContainer>
      </SidebarContainer>
    </animated.div>
  );
}

export default Sidebar;