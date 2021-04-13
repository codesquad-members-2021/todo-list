const resize = (textarea) => {
  const currentHeight = textarea.current.clientHeight;
  const scrollHeight = textarea.current.scrollHeight;
  if (currentHeight < scrollHeight) {
    textarea.current.style.height = `${textarea.current.scrollHeight + 2}px`;
  }
};

export default resize;
