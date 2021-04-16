import { useEffect, useState } from 'react';
import Close from './Close';
import LogCard from './LogCard';
import {
  SidebarContainer,
  CloseContainer,
  LogListContainer,
} from './sidebarStyle';
import { useSpring, animated } from 'react-spring';

const Sidebar = ({ toggleSidebar, transitionFrom, transitionTo, visible }) => {
  const [logData, setLogData] = useState([]);

  useEffect(() => {
    const url = '/logs';
    fetchData(url, setLogData);
    
  }, []);

  const fetchData = async (url, callback) => {
    const response = await fetch(url);
    const data = await response.json();
    console.log(data);
    callback(data);
  };

  const spring = useSpring({
    from: {
      transform: `translate(${transitionFrom}px)`,
      display: visible,
    },
    to: {
      transform: `translate(${transitionTo}px)`,
      display: visible,
    },
    config: {
      mass: 1,
    },
  });

  // const logList = logData.map((data, i) => {
  //   return <LogCard key={data.logs[i].id} data={data} userID={data.userID} />;
  // });

  return (
    <animated.div style={{ ...spring }}>
      <SidebarContainer>
        <CloseContainer>
          <Close toggleSidebar={toggleSidebar} />
        </CloseContainer>
        <LogListContainer>
          <LogCard logData={logData}/>
        </LogListContainer>
      </SidebarContainer>
    </animated.div>
  );
};

export default Sidebar;
