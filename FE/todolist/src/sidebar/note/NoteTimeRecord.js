import React, { useEffect, useState } from 'react';
import styled from 'styled-components';

const NoteTimeStyle = styled.div`
    margin-top: 0.5rem;
    font-size: 0.8rem;
    color: #909090;
`;

const NoteTimeRecord = ({ createdTime, isOpen }) => {
    const [ timegap, setTimegap ] = useState()

    const interval = setTimeout(() => {
        if(isOpen) {
            setTimegap(getTimeGap())
        }
    }, 1000);

    useEffect(() => {
        if (!isOpen) {
            clearInterval(interval);
        }
    }, [isOpen]);

    const getTimeGap = () => {
        let now = new Date();
        const recordedTime = new Date(createdTime);
        const minutes = (((now - recordedTime) / 1000) / 60).toFixed(0);
        return minutes > 60 ? calculateHourDay(minutes) : minutes;
    }

    const calculateHourDay = (min) => {
        let hour = (min / 60).toFixed(0);
        const minute = min % 60;
        if (hour > 24) {
            hour = hour % 24;
            const day = (hour / 24).toFixed(0);
            return `${day}일 ${hour}시간 ${minute}`
        }
        return `${hour}시간 ${minute}`;
    }

    return (
        <NoteTimeStyle>{timegap}분 전</NoteTimeStyle>
    )
}

export default NoteTimeRecord;