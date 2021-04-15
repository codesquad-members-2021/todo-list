import React, { useEffect } from 'react';
import styled from 'styled-components';

const NoteBodyStyle = styled.div`
    margin-top: 0.5rem;
    font-size: 0.9rem;
`;

const NoteBody = ({ noteData }) => {

    const switchMsgToKor = (msg) => {
        const actionObj = {
            "TODO":"해야할 일",
            "PROGRESS":"하고 있는 일",
            "DONE": "완료한 일",
            "CREATE": "등록",
            "MOVE": "이동",
            "REMOVE": "삭제",
            "UPDATE": "변경"
        }
        return actionObj[msg];
    }

    const createMsg = ({ beforeStatus, afterStatus, title, action }) => {
        const updateAndMove = `${title}를(을) ${switchMsgToKor(beforeStatus)}에서 ${switchMsgToKor(afterStatus)}로 ${switchMsgToKor(action)}하였습니다.`;
        const createAndRemove = `${title}를(을) ${switchMsgToKor(beforeStatus)}에(서) ${switchMsgToKor(action)}하였습니다.`
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