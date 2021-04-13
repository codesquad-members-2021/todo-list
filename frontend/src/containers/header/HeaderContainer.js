import React, { useState } from 'react';
import HeaderTemplate from '../../components/header/HeaderTemplate';


const HeaderContainer = () => {
    const [activityHide, setActivityHide] = useState(true);
    const [activityDatas] = useState([
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
        <HeaderTemplate
            title={'TO-DO LIST'}
            onClickForLogVisible={onClickForLogVisible}
            activityHide={activityHide}
            activityDatas={activityDatas}
        />
    );
};

export default HeaderContainer;
