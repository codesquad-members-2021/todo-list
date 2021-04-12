import HistoryList from "../molecules/HistoryList";
import HistoryItem from "../molecules/HistoryItem";

const HistoryContent = ({ ...props }) => {
  return (
    <>
      <HistoryList {...props}>
        <HistoryItem />
      </HistoryList>
    </>
  );
};

export default HistoryContent;
