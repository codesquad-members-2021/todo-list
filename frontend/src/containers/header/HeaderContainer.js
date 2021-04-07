import React, { useState, useEffect } from 'react';
import HeaderTemplate from '../../components/header/HeaderTemplate';

const HeaderContainer = (/* {...props} */) => {
    const [logHide, setLogHide] = useState(true);

    useEffect(() => {
        // 추후 데이터처리..
    }, [logHide]);

    const onClickForLogVisible = ({ target }) => {
        const closestMenuBtn = target.closest("button");
        if (!closestMenuBtn) return;
        setLogHide(!logHide);
    };

    return (
        <HeaderTemplate
            title={'TO-DO LIST'}
            logHide={logHide}
            onClickForLogVisible={onClickForLogVisible}
        />
    );
};

export default HeaderContainer;
