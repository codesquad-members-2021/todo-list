import React, { useEffect, useState } from 'react';
import TopbarTemplate from '../../components/topbar/TopbarTemplate';
import { calcPastTime, fetchData } from '../../lib/utility/util';

const TopbarContainer = () => {
    const [activityHide, setActivityHide] = useState(true);
    const [activityDatas, setActivityDatas] = useState(null);

    useEffect(() => {
        fetchData({
            url: '/api/activities',
            method: 'get'
        }).then((data) => {
            if (!data || !data.activities) return;

            setActivityDatas(
                data.activities.map((activitieData) => {
                    const convertTime = new Date(activitieData.actionTime);
                    convertTime.setHours(convertTime.getHours() + 9);

                    return {
                        ...activitieData,
                        convertTime: calcPastTime(convertTime),
                    }
                }),
            );
        });
    }, []);

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
            activityDatas={activityDatas && activityDatas}
        />
    );
};

export default TopbarContainer;
