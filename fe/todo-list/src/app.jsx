import './app.css';
import Button from './components/button/button';
import Icon from './components/icon/icon';
import TaskCardCount from './components/taskCardCount/taskCardCount';
import ColumnHeader from './components/columnHeader/columnHeader';
import Card from './components/card/card';

function App() {
  return (
    <div className="App">
      <Icon type="add" />
      <Icon type="delete" />
      <Icon type="userAction" />
      <Button type="cancel" name="취소" />
      <Button type="delete" name="삭제" />
      <Button type="submit" name="등록" />
      <Button type="edit" name="수정" />
      <TaskCardCount />
      <ColumnHeader />
      <Card type="default" />
      <Card type="active" />
      {/* <Card type="delete" />
      <Card type="drag" />
      <Card type="place" /> */}
      <Card type="deactivate" />
    </div>
  );
}

export default App;
