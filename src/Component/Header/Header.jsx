import { useState } from 'react';
import HeaderTitle from './HeadeTitle'
import Popup from './Popup';
import { useTodoUserNameContext } from '../Context';
// import Navigator from './Navigator'

export default function Header () {
  const [toggle, setToggle] = useState(false);
  const [author, dispatch] = useTodoUserNameContext();
  const onClick = () => setToggle(!toggle);
  const onUpdate = name => {
    dispatch({ name });
    setToggle(!toggle);
  };
  return (
    <>
      <HeaderTitle onPopupToggleButtonClick={onClick}/>
      <Popup author={author} toggle={toggle} onUpdate={onUpdate} onCancel={onClick}/>
    </>
  )
}
