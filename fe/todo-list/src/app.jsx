import './app.css';
import Button from './components/button/button';
import Icon from './components/icon/icon';

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
    </div>
  );
}

export default App;
