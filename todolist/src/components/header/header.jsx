import React from "react";
import HeaderTitle from "./headerTitle.jsx";
import ShowLogButton from "./showLogButton.jsx";
import styles from "./header.module.css";

const Header = ({ renderLoghandler }) => {
  return (
    <section className="header">
      <div className={styles.headerContainer}>
        <HeaderTitle />
        <ShowLogButton renderLoghandler={renderLoghandler} />
      </div>
    </section>
  );
};

export default Header;
