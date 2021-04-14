import React, { useState } from 'react';
import HeaderTemplate from '../../components/header/HeaderTemplate';


const HeaderContainer = () => {
    const [activityHide, setActivityHide] = useState(true);
    // 데이터용 State 필요

    const onClickForLogVisible = ({ target }) => {
        const closestMenuBtn = target.closest('button');
        if (!closestMenuBtn) return;
        setActivityHide(!activityHide);
    };

    return (
        <HeaderTemplate
            title={'TO-DO LIST'}
            onClickForLogVisible={onClickForLogVisible}
            activityHide={activityHide}
        />
    );
};

export default HeaderContainer;
