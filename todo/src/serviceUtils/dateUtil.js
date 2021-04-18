const getFormatDate = () => {
  const date = new Date();
  const yyyymmdd = date.toISOString().split('T')[0];
  const hhmmss = date.toTimeString().split(' ')[0];
  return `${yyyymmdd} ${hhmmss}`;
}

const getTimeTaken = (currentTime, writtenTime) => {

  const multiplyMilliseconds = {
    day: [86400000, '일'], //1000 * 60 * 60 * 24
    hour: [3600000, '시간'], //1000 * 60 * 60
    minutes: [60000, '분'], //1000 * 60
    seconds: [1000, '초'],
  }

  const milliseconds = currentTime - new Date(writtenTime);

  for (const key in multiplyMilliseconds) {
    const [divideTime, unit] = multiplyMilliseconds[key];
    if (divideTime < milliseconds) {
      return `${Math.floor(milliseconds / divideTime)}${unit}`;
    }
  }
  return '1초';
}

export { getFormatDate, getTimeTaken };