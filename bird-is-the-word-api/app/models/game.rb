class Game < ApplicationRecord
  has_many :game_players
  has_many :players, through: :game_players, source: :user
  after_initialize :init
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
      {"letter": "A", "points": 1, "x": "", "y": "", "id": 0},
      {"letter": "A", "points": 1, "x": "", "y": "", "id": 1},
      {"letter": "A", "points": 1, "x": "", "y": "", "id": 2},
      {"letter": "A", "points": 1, "x": "", "y": "", "id": 3},
      {"letter": "A", "points": 1, "x": "", "y": "", "id": 4},
      {"letter": "A", "points": 1, "x": "", "y": "", "id": 5},
      {"letter": "A", "points": 1, "x": "", "y": "", "id": 6},
      {"letter": "A", "points": 1, "x": "", "y": "", "id": 7},
      {"letter": "A", "points": 1, "x": "", "y": "", "id": 8},
      {"letter": "A", "points": 1, "x": "", "y": "", "id": 9},

      {"letter": "B", "points": 3, "x": "", "y": "", "id": 10},
      {"letter": "B", "points": 3, "x": "", "y": "", "id": 11},

      {"letter": "C", "points": 3, "x": "", "y": "", "id": 12},
      {"letter": "C", "points": 3, "x": "", "y": "", "id": 13},

      {"letter": "D", "points": 2, "x": "", "y": "", "id": 14},
      {"letter": "D", "points": 2, "x": "", "y": "", "id": 15},
      {"letter": "D", "points": 2, "x": "", "y": "", "id": 16},
      {"letter": "D", "points": 2, "x": "", "y": "", "id": 17},

      {"letter": "E", "points": 1, "x": "", "y": "", "id": 18},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 19},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 20},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 21},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 22},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 23},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 24},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 25},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 26},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 27},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 28},
      {"letter": "E", "points": 1, "x": "", "y": "", "id": 29},

      {"letter": "F", "points": 4, "x": "", "y": "", "id": 30},
      {"letter": "F", "points": 4, "x": "", "y": "", "id": 31},

      {"letter": "G", "points": 2, "x": "", "y": "", "id": 32},
      {"letter": "G", "points": 2, "x": "", "y": "", "id": 33},
      {"letter": "G", "points": 2, "x": "", "y": "", "id": 34},

      {"letter": "H", "points": 4, "x": "", "y": "", "id": 35},
      {"letter": "H", "points": 4, "x": "", "y": "", "id": 36},

      {"letter": "I", "points": 1, "x": "", "y": "", "id": 37},
      {"letter": "I", "points": 1, "x": "", "y": "", "id": 38},
      {"letter": "I", "points": 1, "x": "", "y": "", "id": 39},
      {"letter": "I", "points": 1, "x": "", "y": "", "id": 40},
      {"letter": "I", "points": 1, "x": "", "y": "", "id": 41},
      {"letter": "I", "points": 1, "x": "", "y": "", "id": 42},
      {"letter": "I", "points": 1, "x": "", "y": "", "id": 43},
      {"letter": "I", "points": 1, "x": "", "y": "", "id": 44},
      {"letter": "I", "points": 1, "x": "", "y": "", "id": 45},

      {"letter": "J", "points": 8, "x": "", "y": "", "id": 46},

      {"letter": "K", "points": 5, "x": "", "y": "", "id": 47},

      {"letter": "L", "points": 1, "x": "", "y": "", "id": 48},
      {"letter": "L", "points": 1, "x": "", "y": "", "id": 49},
      {"letter": "L", "points": 1, "x": "", "y": "", "id": 50},
      {"letter": "L", "points": 1, "x": "", "y": "", "id": 51},

      {"letter": "M", "points": 3, "x": "", "y": "", "id": 52},
      {"letter": "M", "points": 3, "x": "", "y": "", "id": 53},

      {"letter": "N", "points": 1, "x": "", "y": "", "id": 54},
      {"letter": "N", "points": 1, "x": "", "y": "", "id": 55},
      {"letter": "N", "points": 1, "x": "", "y": "", "id": 56},
      {"letter": "N", "points": 1, "x": "", "y": "", "id": 57},
      {"letter": "N", "points": 1, "x": "", "y": "", "id": 58},
      {"letter": "N", "points": 1, "x": "", "y": "", "id": 59},

      {"letter": "O", "points": 1, "x": "", "y": "", "id": 60},
      {"letter": "O", "points": 1, "x": "", "y": "", "id": 61},
      {"letter": "O", "points": 1, "x": "", "y": "", "id": 62},
      {"letter": "O", "points": 1, "x": "", "y": "", "id": 63},
      {"letter": "O", "points": 1, "x": "", "y": "", "id": 64},
      {"letter": "O", "points": 1, "x": "", "y": "", "id": 65},
      {"letter": "O", "points": 1, "x": "", "y": "", "id": 66},
      {"letter": "O", "points": 1, "x": "", "y": "", "id": 67},

      {"letter": "P", "points": 3, "x": "", "y": "", "id": 68},
      {"letter": "P", "points": 3, "x": "", "y": "", "id": 69},

      {"letter": "R", "points": 1, "x": "", "y": "", "id": 70},
      {"letter": "R", "points": 1, "x": "", "y": "", "id": 71},
      {"letter": "R", "points": 1, "x": "", "y": "", "id": 72},
      {"letter": "R", "points": 1, "x": "", "y": "", "id": 73},
      {"letter": "R", "points": 1, "x": "", "y": "", "id": 74},
      {"letter": "R", "points": 1, "x": "", "y": "", "id": 75},

      {"letter": "S", "points": 1, "x": "", "y": "", "id": 76},
      {"letter": "S", "points": 1, "x": "", "y": "", "id": 77},
      {"letter": "S", "points": 1, "x": "", "y": "", "id": 78},
      {"letter": "S", "points": 1, "x": "", "y": "", "id": 79},

      {"letter": "T", "points": 1, "x": "", "y": "", "id": 80},
      {"letter": "T", "points": 1, "x": "", "y": "", "id": 81},
      {"letter": "T", "points": 1, "x": "", "y": "", "id": 82},
      {"letter": "T", "points": 1, "x": "", "y": "", "id": 83},
      {"letter": "T", "points": 1, "x": "", "y": "", "id": 84},
      {"letter": "T", "points": 1, "x": "", "y": "", "id": 85},

      {"letter": "U", "points": 1, "x": "", "y": "", "id": 86},
      {"letter": "U", "points": 1, "x": "", "y": "", "id": 87},
      {"letter": "U", "points": 1, "x": "", "y": "", "id": 88},
      {"letter": "U", "points": 1, "x": "", "y": "", "id": 89},

      {"letter": "V", "points": 4, "x": "", "y": "", "id": 90},
      {"letter": "V", "points": 4, "x": "", "y": "", "id": 91},

      {"letter": "W", "points": 4, "x": "", "y": "", "id": 92},
      {"letter": "W", "points": 4, "x": "", "y": "", "id": 93},

      {"letter": "X", "points": 8, "x": "", "y": "", "id": 94},

      {"letter": "Y", "points": 4, "x": "", "y": "", "id": 95},
      {"letter": "W", "points": 4, "x": "", "y": "", "id": 96},

      {"letter": "Z", "points": 10, "x": "", "y": "", "id": 97},

      {"letter": "", "points": "", "x": "", "y": "", "id": 98},
      {"letter": "", "points": "", "x": "", "y": "", "id": 99}
  ]

    self.bag = Array(0..99)
  end
end
