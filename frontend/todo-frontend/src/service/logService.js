const logService = {
  postLog: (newLog) => {
    const db = localStorage.getItem("logs");
    const logs = JSON.parse(db);
    if (logs) localStorage.setItem("logs", JSON.stringify([newLog, ...logs]));
    else localStorage.setItem("logs", JSON.stringify([newLog]));
  },
  getLog: () => {
    const db = localStorage.getItem("logs");
    return JSON.parse(db);
  },
};

export default logService;
