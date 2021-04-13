import React from 'react';
import HeaderTitle from './headerTitle.jsx';
import ShowLogButton from './showLogButton.jsx';
import styles from './header.module.css';
import HeaderStyle from './headerTitle.style';

const Header = ({renderLoghandler}) => {
  return (
    <section className="header">
      <HeaderStyle className={styles.headerContainer}>
        <HeaderTitle  />
        <ShowLogButton renderLoghandler={renderLoghandler} />
      </HeaderStyle>
    </section>
  );
};

export default Header;
