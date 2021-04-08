import React from "react";
import HeaderTitle from "./headerTitle.jsx";
import ShowLogButton from "./showLogButton.jsx";

const Header = () => {
  return (
    <section className="header">
      <HeaderTitle />
      <ShowLogButton />
    </section>
  );
};

export default Header;
