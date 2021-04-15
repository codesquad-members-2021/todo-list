import { useState } from 'react';
import HeaderTitle from './HeadeTitle'
import Popup from './Popup';
// import Navigator from './Navigator'

export default function Header () {
  const [toggle, setToggle] = useState(false);
  const [author, setAuthor] = useState("author");
  const onClick = () => setToggle(!toggle);
  const onUpdate = e => {
    setAuthor(e.target.value);
    setToggle(!toggle);
  };
  return (
    <>
      <HeaderTitle onPopupToggleButtonClick={onClick}/>
      <Popup author={author} toggle={toggle} onUpdate={onUpdate} onCancel={onClick}/>
    </>
  )
}
