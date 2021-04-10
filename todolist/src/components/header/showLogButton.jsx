import React from 'react';
import styled from 'styled-components';
import { ReactComponent as menuBtn } from './showLogButton.svg';

const MenuBtn = styled(menuBtn)`
  width: 17px;
  height: 11px;
`;

const ShowLogButton = () => {
  return (
    <div className="show-log-button-section">
      <MenuBtn className="show-log-button" />
    </div>
  );
  
// import menu from './menu.svg';
// import styles from "./header.module.css"

// const showModal = () => {
// 	console.log("A")
// }

// const ShowLogButton = () => {
// 	return (
// 		<div className="show-log-button-section">
// 			<button className={styles.showLogButton} onClick={showModal}>
// 				<img src={menu} className="menu-btn" alt="menu-btn" />
// 			</button>
// 		</div>
// 	)
// };

export default ShowLogButton;
