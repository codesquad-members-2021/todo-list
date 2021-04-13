import { useState, useEffect } from "react";
import logService from "../service/logService.js";

const useLogHook = (defaultLogs) => {
  const [logs, setLogs] = useState(defaultLogs);

  const postLogs = (newLog) => {
    logService.postLog(newLog);
    const newLogs = logService.getLog();
    setLogs([...newLogs]);
  };

  useEffect(() => {
    const logs = logService.getLog();
    setLogs(logs);
  }, []);

  return [logs, postLogs];
};

export default useLogHook;
