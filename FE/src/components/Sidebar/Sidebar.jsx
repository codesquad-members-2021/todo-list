import React, { useEffect, useState } from 'react';
import Close from './Close';
import LogList from './LogList';
import { SidebarContainer, CloseContainer, LogContainer } from './sidebarStyle'
import { useSpring, animated } from 'react-spring';

const Sidebar = ({isClicked, toggleSidebar}) => {
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

  let spring = useSpring({
    from: {
      transform: `translate(-120px)`,
    },
    to: {
      transform: `translate(-360px)`,
    },
    config: {
      mass: 6,
    },
  });


                                        // inline-block <-> none
  return (
    isClicked ? <animated.div style={{ ...spring, display: 'inline-block'}}>  
      <SidebarContainer>
        <CloseContainer>
          <Close toggleSidebar = {toggleSidebar}/>
        </CloseContainer>
        <LogContainer>
          <LogList logArray={logArray} />
        </LogContainer>
      </SidebarContainer>
    </animated.div> : <></>
  );
}

export default Sidebar;