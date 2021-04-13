import './reset.css';
import { useRef, useState } from 'react';
import HeaderTitle from './header/HeaderTitle';
// import ColumnList from './content/column/ColumnList';
import Sidebar from './sidebar/Sidebar';
//공유하는 속성이 있다면 app(공유하는 최상단)에다가 useContext/ store
function App() {
  const sidebar = useRef();
  const [ open, setOpen ] = useState(false);
  const [ noteList, setNoteList ] = useState([])

  const showSidebar = () => {
    const sidebarPage = sidebar.current;
    sidebarPage.style.transform = 'translateX(0px)';
    setOpen(open => !open);
  }

  return (
    <>
      <HeaderTitle handleClick={showSidebar}/>
      {/* <ColumnList setNoteList={setNoteList}/> */}
      <Sidebar sidebarRef={sidebar} open={open} noteList={noteList} setNoteList={setNoteList}/>
    </>
  );
}

export default App;
