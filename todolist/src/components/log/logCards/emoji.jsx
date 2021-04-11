import React from 'react';

const Emoji = ({ emoji }) => {
  return (
    <div className="emoji-section">
      <span className="emoji">{emoji}</span>
    </div>
  );
};

export default Emoji;
