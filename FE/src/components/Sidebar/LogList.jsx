import { useState, useEffect } from 'react';
import LogCard from './LogCard';

const LogList = ({ logData }) => {
  const [logs, setLogs] = useState();

  // useEffect(() => {
  //   setLogs(logData.logList);
  // }, []);

  console.log(logs);

  return (
    <>
      <LogCard />
    </>
  );
};

export default LogList;
