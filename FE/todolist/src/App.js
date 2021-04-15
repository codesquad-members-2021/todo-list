import './reset.css';
import { useRef, useState } from 'react';
import HeaderTitle from './header/HeaderTitle';
import ColumnList from './content/column/ColumnList';
import Sidebar from './sidebar/Sidebar';

function App() {

  const sidebar = useRef();
  const [ sidebarLog, setSidebarLog ] = useState()
  const [ isOpen, setIsOpen ] = useState(false);

  const showSidebar = () => {
    const sidebarPage = sidebar.current;
    sidebarPage.style.transform = 'translateX(0px)';
    setIsOpen(true);
  }

  return (
    <>
      <HeaderTitle handleClick={showSidebar}/>
      <ColumnList setSidebarLog={setSidebarLog}/>
      <Sidebar sidebarRef={sidebar} sidebarLog={sidebarLog} isOpen={isOpen} setIsOpen={setIsOpen} />
    </>
  );
}

export default App;
