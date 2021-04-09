import React, {useState} from 'react'

import styled from 'styled-components';
import HeaderContainer from '../Components/Header/HeaderContainer';
import TodoColumnListContainer from '../Components/TodoColumnList/TodoColumnListContainer';

// import reducer from '../util/reducer';

// todocard: { title: '', content: '', createDate: null, updateDate: null, author: '', },
// todoChange: {title:, date:, author:, action:, from:, to: }
// Date : YYYY-MM-DDTHH:MM;

const MainPage = () => {
  const [todoHistory, setTodoHistory] = useState([]);
  
  const handleChangeTodo = ({type, payload}) => {
    // 1) 타입(아마도 액션명) 감지
    // 2) HeaderContainer는 todos를 props로 전달받고 있음.
    // 3) setTodos로 업데이트
    
    // switch(type) {
    //   case "ADD_CARD":
    //     const newTodos = {
    //       ...todoState.todos,
    //       [payload.columnName]: [...todoState.todos[payload.columnName], payload.value], 
    //     };
    //     const newTodoChanges = {
    //       ...todoState.todoChanges

    //     }
    //     setTodos({
    //       ...todoState.todos,
    //       [todoState.todoChanges]: payload.value
    //     });
    // }
  }
  
  return (
    <MainLayout>
      <HeaderContainer todoHistory={todoHistory} />
      <TodoColumnListContainer />
    </MainLayout>
  )
}

const Responsive = styled.div`
  margin-left: 80px;
`
const MainLayout = styled(Responsive)`
  width: 100%;
  
  display: flex;
  flex-direction: column;
`;

export default MainPage
