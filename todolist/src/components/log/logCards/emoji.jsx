import React from 'react';
// import EmojiStyle from './historyTime';

const Emoji = ({ emoji }) => {
  return (
    <div className="emoji-section">
      <span className="emoji">{emoji}</span>
    </div>
  );
};

export default Emoji;
