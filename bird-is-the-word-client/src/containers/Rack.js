import React from 'react';


const Rack = (props) => {
  
  const rack = props.players.players[0].rack.map(letter => {
    return <th className="square"> {letter} </th>
  })
  return(
    <div>
      <h1>{props.players.players[0].name}</h1>
      <table>
        {rack}
      </table>
    </div>
  )
  
}

export default Rack;