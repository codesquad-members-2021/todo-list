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
    const url = 'http://localhost:3000/logData.json';
    fetchData(url, setLogData);
  }, []);

  const fetchData = async (url, callback) => {
    const response = await fetch(url);
    const data = await response.json();
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

  const logList = logData.map((data, i) => {
    return (
      <LogCard key={data.logList[i].id} data={data} userID={data.userID} />
    );
  });

  return (
    <animated.div style={{ ...spring }}>
      <SidebarContainer>
        <CloseContainer>
          <Close toggleSidebar={toggleSidebar} />
        </CloseContainer>
        <LogListContainer>
          <div>{logList}</div>
        </LogListContainer>
      </SidebarContainer>
    </animated.div>
  );
};

export default Sidebar;
