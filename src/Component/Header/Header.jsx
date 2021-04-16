import { useState } from 'react';
import HeaderTitle from './HeadeTitle'
import Popup from './Popup';
import { useTodoUserNameContext, useTodoDispatch } from '../Context';
import CreateColumn from './CreateColumn';
// import Navigator from './Navigator'

export default function Header () {
  const [toggle, setToggle] = useState(false);
  const [toggleB, setToggleB] = useState(false);
  const [author, dispatch] = useTodoUserNameContext();
  const columnDispatch = useTodoDispatch();
  const onClick = () => setToggle(!toggle);
  const onClickB = () => setToggleB(!toggleB);
  const onUpdate = name => {
    dispatch({ name });
    setToggle(!toggle);
  };
  const onCreate = title => {
    columnDispatch({ type: "CREATECOLUMN", title });
    setToggleB(!toggleB);
  }
  return (
    <>
      <HeaderTitle onPopupToggleButtonClick={onClick} onPopupToggleButtonClickB={onClickB}/>
      <CreateColumn onCreate={onCreate} toggle={toggleB} onCancel={onClickB}/>
      <Popup author={author} toggle={toggle} onUpdate={onUpdate} onCancel={onClick}/>
    </>
  )
}
