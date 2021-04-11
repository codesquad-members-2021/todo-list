import React from 'react';
import Close from './Close';
import LogList from './LogList';
import {SidebarContainer, CloseContainer, LogContainer} from './sidebarStyle'

const Sidebar = () => {
  return (
    <SidebarContainer>
        <CloseContainer>
      <Close/>
        </CloseContainer>
      <LogContainer>
          <LogList/>
      </LogContainer>
    </SidebarContainer>
  );
}

export default Sidebar;