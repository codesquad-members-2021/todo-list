import React from 'react'

const InputTitle = () => {
	//아마 useEffect를 써서 onChange시에 뭐할듯?
	return (
		<div className="input-title-section">
			<input className="input-title" type="text" placeholder="제목을 입력하세요"></input>
		</div>
	)
};

export default InputTitle