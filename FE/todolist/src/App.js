import './reset.css';
import { useRef } from 'react';
import HeaderTitle from './header/HeaderTitle';
import ColumnList from './content/column/ColumnList';
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
      <ColumnList />
      <Sidebar sidebarRef={sidebar}/>
    </>
  );
}

export default App;
