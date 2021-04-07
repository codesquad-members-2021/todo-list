import React from 'react';
import './Header.css';
import Menu from 'atoms/Menu';


const Header = () => {
    return (
        <div className="Header">
            TO-DO LIST
            <Menu/>
        </div>
    );
}

export default Header;