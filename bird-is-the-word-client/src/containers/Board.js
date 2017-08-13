import React from 'react';

const Board = (props) => (
  <div>
    {props.board.full_board.map(rows => 
      rows.map(square =>
        <div>
          <p>{square.value}</p>
        </div>
        )
      )
    }
  </div>
)

export default Board;

