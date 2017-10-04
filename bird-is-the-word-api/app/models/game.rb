class Game < ApplicationRecord
  has_many :game_players
  has_many :players, through: :game_players, source: :user
  before_create :init
  def init
    self.board = [
    #row1
      [
        {"word": 3, "letter": 1, "value": "", "color": "orange"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 3, "letter": 1, "value": "", "color": "orange"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 3, "letter": 1, "value": "", "color": "orange"}
      ],
      #row2
      [
        {"word": 1, "letter": 1, "value": "", "color": "white"}, 
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"}
      ],
      #row3
      [
        {"word": 1, "letter": 1, "value": "", "color": "white"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"}
      ],
      #row4
      [
        {"word": 1, "letter": 2, "value": "", "color": "blue"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"}
      ],
      #row5
      [
        {"word": 1, "letter": 1, "value": "", "color": "white"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"}
      ],
      #row6
      [
        {"word": 1, "letter": 1, "value": "", "color": "white"}, 
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"}
      ],
      #row7
      [
        {"word": 1, "letter": 1, "value": "", "color": "white"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"}
      ],
      #row8
      [
        {"word": 3, "letter": 1, "value": "","color": "orange"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 3, "letter": 1, "value": "", "color": "orange"}
      ],
      #row9
      [
        {"word": 1, "letter": 1, "value": "", "color": "white"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"}
      ],
      #row10
      [
        {"word": 1, "letter": 1, "value": "", "color": "white"}, 
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"}
      ],
      #row11
      [
        {"word": 1, "letter": 1, "value": "", "color": "white"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"}
      ],
      #row12
      [
        {"word": 1, "letter": 2, "value": "", "color": "blue"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"}
      ],
      #row13
      [
        {"word": 1, "letter": 1, "value": "", "color": "white"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"}
      ],
      #row14
      [
        {"word": 1, "letter": 1, "value": "", "color": "white"}, 
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 3, "value": "", "color": "green"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 2, "letter": 1, "value": "", "color": "red"},
        {"word": 1, "letter": 1, "value": "", "color": "white"}
      ],
      #row15
      [
        {"word": 3, "letter": 1, "value": "", "color": "orange"}, 
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 3, "letter": 1, "value": "", "color": "orange"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 2, "value": "", "color": "blue"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 1, "letter": 1, "value": "", "color": "white"},
        {"word": 3, "letter": 1, "value": "", "color": "orange"}
      ]
    ]
    self.tiles = [
      {"letter": "A", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 0},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 1},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 2},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 3},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 4},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 5},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 6},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 7},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 8},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 9},

      {"letter": "B", "points": 3, "x": nil, "y": nil, "draggable": true, "id": 10},
      {"letter": "B", "points": 3, "x": nil, "y": nil, "draggable": true, "id": 11},

      {"letter": "C", "points": 3, "x": nil, "y": nil, "draggable": true, "id": 12},
      {"letter": "C", "points": 3, "x": nil, "y": nil, "draggable": true, "id": 13},

      {"letter": "D", "points": 2, "x": nil, "y": nil, "draggable": true, "id": 14},
      {"letter": "D", "points": 2, "x": nil, "y": nil, "draggable": true, "id": 15},
      {"letter": "D", "points": 2, "x": nil, "y": nil, "draggable": true, "id": 16},
      {"letter": "D", "points": 2, "x": nil, "y": nil, "draggable": true, "id": 17},

      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 18},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 19},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 20},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 21},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 22},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 23},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 24},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 25},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 26},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 27},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 28},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 29},

      {"letter": "F", "points": 4, "x": nil, "y": nil, "draggable": true, "id": 30},
      {"letter": "F", "points": 4, "x": nil, "y": nil, "draggable": true, "id": 31},

      {"letter": "G", "points": 2, "x": nil, "y": nil, "draggable": true, "id": 32},
      {"letter": "G", "points": 2, "x": nil, "y": nil, "draggable": true, "id": 33},
      {"letter": "G", "points": 2, "x": nil, "y": nil, "draggable": true, "id": 34},

      {"letter": "H", "points": 4, "x": nil, "y": nil, "draggable": true, "id": 35},
      {"letter": "H", "points": 4, "x": nil, "y": nil, "draggable": true, "id": 36},

      {"letter": "I", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 37},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 38},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 39},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 40},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 41},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 42},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 43},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 44},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 45},

      {"letter": "J", "points": 8, "x": nil, "y": nil, "draggable": true, "id": 46},

      {"letter": "K", "points": 5, "x": nil, "y": nil, "draggable": true, "id": 47},

      {"letter": "L", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 48},
      {"letter": "L", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 49},
      {"letter": "L", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 50},
      {"letter": "L", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 51},

      {"letter": "M", "points": 3, "x": nil, "y": nil, "draggable": true, "id": 52},
      {"letter": "M", "points": 3, "x": nil, "y": nil, "draggable": true, "id": 53},

      {"letter": "N", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 54},
      {"letter": "N", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 55},
      {"letter": "N", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 56},
      {"letter": "N", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 57},
      {"letter": "N", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 58},
      {"letter": "N", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 59},

      {"letter": "O", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 60},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 61},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 62},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 63},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 64},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 65},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 66},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 67},

      {"letter": "P", "points": 3, "x": nil, "y": nil, "draggable": true, "id": 68},
      {"letter": "P", "points": 3, "x": nil, "y": nil, "draggable": true, "id": 69},

      {"letter": "R", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 70},
      {"letter": "R", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 71},
      {"letter": "R", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 72},
      {"letter": "R", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 73},
      {"letter": "R", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 74},
      {"letter": "R", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 75},

      {"letter": "S", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 76},
      {"letter": "S", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 77},
      {"letter": "S", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 78},
      {"letter": "S", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 79},

      {"letter": "T", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 80},
      {"letter": "T", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 81},
      {"letter": "T", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 82},
      {"letter": "T", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 83},
      {"letter": "T", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 84},
      {"letter": "T", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 85},

      {"letter": "U", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 86},
      {"letter": "U", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 87},
      {"letter": "U", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 88},
      {"letter": "U", "points": 1, "x": nil, "y": nil, "draggable": true, "id": 89},

      {"letter": "V", "points": 4, "x": nil, "y": nil, "draggable": true, "id": 90},
      {"letter": "V", "points": 4, "x": nil, "y": nil, "draggable": true, "id": 91},

      {"letter": "W", "points": 4, "x": nil, "y": nil, "draggable": true, "id": 92},
      {"letter": "W", "points": 4, "x": nil, "y": nil, "draggable": true, "id": 93},

      {"letter": "X", "points": 8, "x": nil, "y": nil, "draggable": true, "id": 94},

      {"letter": "Y", "points": 4, "x": nil, "y": nil, "draggable": true, "id": 95},
      {"letter": "W", "points": 4, "x": nil, "y": nil, "draggable": true, "id": 96},

      {"letter": "Z", "points": 10, "x": nil, "y": nil, "draggable": true, "id": 97},

      {"letter": "", "points": "", "x": nil, "y": nil, "draggable": true, "id": 98},
      {"letter": "", "points": "", "x": nil, "y": nil, "draggable": true, "id": 99}
]

    self.bag = Array(0..99)
  end
end
