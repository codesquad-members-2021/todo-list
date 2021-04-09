import React, { useState, useEffect, useImperativeHandle, useRef } from "react";
import HeaderPresentational from "./HeaderPresentational";

function HeaderContainer({ todos }) {
  const $Header = useRef();
  const [mode, setMode] = useState(false);

  useImperativeHandle($Header, () => ({
    setState: () => {
      $Header.current.setMode();
    }
  }));


  useEffect(() => {
    console.log('HeaderContainer mount', todos);
  }, [])

  return (
    <div>
      <HeaderPresentational mode={mode} setMode={setMode} > </HeaderPresentational>
    </div>
  );
}

export default HeaderContainer;
