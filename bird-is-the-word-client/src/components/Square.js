import React from 'react';

const Square = (props) => (
    <th className={"square " + props.square.color}>{props.square.value}</th>
)

export default Square;