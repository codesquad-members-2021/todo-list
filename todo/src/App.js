import './App.scss';
import Title from "./components/molecules/Title"
import ButtonList from './components/molecules/ButtonList';
function App() {
  return (
    <div className="App">
      <Title></Title>
      <ButtonList isIcon={false}></ButtonList>
      <ButtonList isIcon={true}></ButtonList>
    </div>
  );
}

export default App;
