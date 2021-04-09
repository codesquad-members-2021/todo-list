import menu from './menu.svg';
import styles from "./header.module.css"

const showModal = () => {
	console.log("A")
}

const ShowLogButton = () => {
	return (
		<div className="show-log-button-section">
			<button className={styles.showLogButton} onClick={showModal}>
				<img src={menu} className="menu-btn" alt="menu-btn" />
			</button>
		</div>
	)
};

export default ShowLogButton