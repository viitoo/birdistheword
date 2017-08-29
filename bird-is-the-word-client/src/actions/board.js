const API_URL = process.env.REACT_APP_API_URL

fetch(`${API_URL}/board`)
  .then(response => response.json())