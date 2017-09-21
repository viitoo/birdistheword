export const updateTilePosition = (id, x, y) => {
  return {
    type: 'UPDATE_TILE_POSITION',
    id,
    x,
    y
  }
}
