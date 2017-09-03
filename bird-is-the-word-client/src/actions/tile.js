const API_URL = process.env.REACT_APP_API_URL

export const updateTilePosition = (id, x, y) => {
  return {
    type: 'UPDATE_POSITION',
    id,
    x,
    y
  }
}