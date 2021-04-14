import React, { useEffect, useState } from 'react';
import TopbarTemplate from '../../components/topbar/TopbarTemplate';
import { calcPastTime } from '../../lib/utility/util';
import tempData from './tempData.json'; // 임시

const TopbarContainer = () => {
    const [activityHide, setActivityHide] = useState(true);
    const [activityDatas, setActivityDatas] = useState(tempData.activities);

    const onClickForLogVisible = ({ target }) => {
        const closestMenuBtn = target.closest('button');
        if (!closestMenuBtn) return;
        setActivityHide(!activityHide);
    };

    useEffect(() => {
        setActivityDatas(
            activityDatas.map((data) => ({
                ...data,
                convertTime: calcPastTime(data.actionTime),
            })),
        );
    }, []);

    return (
        <TopbarTemplate
            title={'TO-DO LIST'}
            onClickForLogVisible={onClickForLogVisible}
            activityHide={activityHide}
            activityDatas={activityDatas}
        />
    );
};

export default TopbarContainer;
