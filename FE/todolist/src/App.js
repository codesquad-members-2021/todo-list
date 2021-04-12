import { useRef } from 'react';
import HeaderTitle from './header/HeaderTitle';
import Sidebar from './sidebar/Sidebar';

function App() {
  const sidebar = useRef();

  const showSidebar = () => {
    const sidebarPage = sidebar.current;
    sidebarPage.style.transform = 'translateX(0px)';
  }

  return (
    <>
      <HeaderTitle handleClick={showSidebar}/>
      <Sidebar sidebarRef={sidebar}/>
    </>
  );
}

export default App;
