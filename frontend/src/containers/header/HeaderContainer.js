import React, { useState } from 'react';
import Header from '../../components/header/Header';
import Activity from '../../components/header/Activity';

const HeaderContainer = () => {
    const [activityHide, setActivityHide] = useState(true);
    const [activityDatas, setActivityDatas] = useState([
        {
            id: 1,
            author: 'sam',
            content:
                'HTML/CSS공부하기를 해야할 일에서 하고 있는 일로 이동하였습니다.',
        },
        {
            id: 2,
            author: 'seong',
            content:
                '해야할 일에 HTML/CSS공부하기를 등록하였습니다.',
        },
    ]);

    const onClickForLogVisible = ({ target }) => {
        const closestMenuBtn = target.closest('button');
        if (!closestMenuBtn) return;
        setActivityHide(!activityHide);
    };

    return (
        <>
            <Header
                title={'TO-DO LIST'}
                onClickForLogVisible={onClickForLogVisible}
            />
            <Activity
                activityHide={activityHide}
                activityDatas={activityDatas}
                onClickForLogVisible={onClickForLogVisible}
            />
        </>
    );
};

export default HeaderContainer;
