import React from 'react';
import EmojiStyle from './emoji.style';

const Emoji = ({ emoji }) => {
  return (
    <EmojiStyle className="emoji-section">
      <span className="emoji">{emoji}</span>
    </EmojiStyle>
  );
};

export default Emoji;
