export function canDropTile(toX, toY, tiles){
  function findTile(tile){
      return tile.x === toX && tile.y === toY
    }
  var tile = tiles.find(findTile);
  return !tile
}