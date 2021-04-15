import React from 'react';
import styled from 'styled-components';

const NoteBodyStyle = styled.div`
    margin-top: 0.5rem;
    font-size: 0.9rem;
`;

const NoteBody = ({ noteData }) => {

    const switchMsgToKor = (msg) => {
        switch(msg) {
            case "TODO":
                return "해야할 일";
            case "PROGRESS":
                return "하고 있는 일";
            case "DONE":
                return "완료한 일";
            case "CREATE":
                return "등록";
            case "MOVE":
                return "이동";
            case "REMOVE":
                return "삭제";
            case "UPDATE":
                return "변경";
        }
    }

    const createMsg = ({ beforeStatus, afterStatus, title, action }) => {
        const updateAndMove = `${title}를(을) ${switchMsgToKor(beforeStatus)}에서 ${switchMsgToKor(afterStatus)}로 ${switchMsgToKor(action)}하였습니다.`;
        const createAndRemove = `${title}를(을) ${switchMsgToKor(beforeStatus)}에 ${switchMsgToKor(action)}하였습니다.`
        const message = beforeStatus === afterStatus ? createAndRemove : updateAndMove;
        return message;
    }

    return (
        <NoteBodyStyle>
            {createMsg(noteData)}
        </NoteBodyStyle>
    )
}

export default NoteBody;