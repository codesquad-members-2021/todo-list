import React from 'react';
import styled from 'styled-components';

const NoteBodyStyle = styled.div`
    margin-top: 0.5rem;
    font-size: 0.9rem;
`;

const NoteBody = ({ noteData }) => {

    const switchMsgToKor = (msg) => {
        let newMsg = '';
        switch(msg) {
            case "TODO":
                newMsg = "해야할 일";
                break;
            case "PROGRESS":
                newMsg = "하고 있는 일";
                break;
            case "DONE":
                newMsg = "완료한 일";
                break;
            case "CREATE":
                newMsg = "등록";
                break;
            case "MOVE":
                newMsg = "이동";
                break;
            case "REMOVE":
                newMsg = "삭제";
                break;
            case "UPDATE":
                newMsg = "변경";
                break;
        }
        return newMsg;
    }

    const createMsg = ({ beforeStatus, afterStatus, title, action }) => {
        const updateAndMove = `${title}를(을) ${switchMsgToKor(beforeStatus)}에서 ${switchMsgToKor(afterStatus)}로 ${switchMsgToKor(action)}하였습니다.`;
        const createAndRemove = `${title}를(을) ${beforeStatus}에 ${switchMsgToKor(action)}하였습니다.`
        const message = afterStatus ? updateAndMove : createAndRemove;
        return message;
    }

    return (
        <NoteBodyStyle>
            {createMsg(noteData)}
        </NoteBodyStyle>
    )
}

export default NoteBody;