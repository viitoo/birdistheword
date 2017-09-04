
export const updateTilePosition = (id, x, y) => {
  return {
    type: 'UPDATE_POSITION',
    id,
    x,
    y
  }
}