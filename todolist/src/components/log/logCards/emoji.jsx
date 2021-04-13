import React from 'react';
// import EmojiStyle from './historyTime';
import EmojiStyle from './emoji.style';

const Emoji = ({ emoji }) => {
  return (
    <div className="emoji-section">
      <EmojiStyle className="emoji">
        {emoji}
      </EmojiStyle>
    </div>
  );
};

export default Emoji;
