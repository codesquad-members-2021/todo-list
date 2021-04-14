import React, { useState } from 'react';
import TopbarTemplate from '../../components/topbar/TopbarTemplate';


const TopbarContainer = () => {
    const [activityHide, setActivityHide] = useState(true);
    // 데이터용 State 필요

    const onClickForLogVisible = ({ target }) => {
        const closestMenuBtn = target.closest('button');
        if (!closestMenuBtn) return;
        setActivityHide(!activityHide);
    };

    return (
        <TopbarTemplate
            title={'TO-DO LIST'}
            onClickForLogVisible={onClickForLogVisible}
            activityHide={activityHide}
        />
    );
};

export default TopbarContainer;
