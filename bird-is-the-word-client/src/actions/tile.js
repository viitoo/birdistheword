const API_URL = process.env.REACT_APP_API_URL

export const updateTilePosition = (item) => {
  return {
    type: 'UPDATE_POSITION',
    item
  }
}