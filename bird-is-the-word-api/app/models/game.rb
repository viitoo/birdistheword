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
      {"letter": "A", "points": 1, "x": nil, "y": nil, "id": 0},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "id": 1},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "id": 2},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "id": 3},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "id": 4},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "id": 5},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "id": 6},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "id": 7},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "id": 8},
      {"letter": "A", "points": 1, "x": nil, "y": nil, "id": 9},

      {"letter": "B", "points": 3, "x": nil, "y": nil, "id": 10},
      {"letter": "B", "points": 3, "x": nil, "y": nil, "id": 11},

      {"letter": "C", "points": 3, "x": nil, "y": nil, "id": 12},
      {"letter": "C", "points": 3, "x": nil, "y": nil, "id": 13},

      {"letter": "D", "points": 2, "x": nil, "y": nil, "id": 14},
      {"letter": "D", "points": 2, "x": nil, "y": nil, "id": 15},
      {"letter": "D", "points": 2, "x": nil, "y": nil, "id": 16},
      {"letter": "D", "points": 2, "x": nil, "y": nil, "id": 17},

      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 18},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 19},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 20},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 21},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 22},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 23},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 24},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 25},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 26},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 27},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 28},
      {"letter": "E", "points": 1, "x": nil, "y": nil, "id": 29},

      {"letter": "F", "points": 4, "x": nil, "y": nil, "id": 30},
      {"letter": "F", "points": 4, "x": nil, "y": nil, "id": 31},

      {"letter": "G", "points": 2, "x": nil, "y": nil, "id": 32},
      {"letter": "G", "points": 2, "x": nil, "y": nil, "id": 33},
      {"letter": "G", "points": 2, "x": nil, "y": nil, "id": 34},

      {"letter": "H", "points": 4, "x": nil, "y": nil, "id": 35},
      {"letter": "H", "points": 4, "x": nil, "y": nil, "id": 36},

      {"letter": "I", "points": 1, "x": nil, "y": nil, "id": 37},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "id": 38},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "id": 39},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "id": 40},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "id": 41},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "id": 42},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "id": 43},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "id": 44},
      {"letter": "I", "points": 1, "x": nil, "y": nil, "id": 45},

      {"letter": "J", "points": 8, "x": nil, "y": nil, "id": 46},

      {"letter": "K", "points": 5, "x": nil, "y": nil, "id": 47},

      {"letter": "L", "points": 1, "x": nil, "y": nil, "id": 48},
      {"letter": "L", "points": 1, "x": nil, "y": nil, "id": 49},
      {"letter": "L", "points": 1, "x": nil, "y": nil, "id": 50},
      {"letter": "L", "points": 1, "x": nil, "y": nil, "id": 51},

      {"letter": "M", "points": 3, "x": nil, "y": nil, "id": 52},
      {"letter": "M", "points": 3, "x": nil, "y": nil, "id": 53},

      {"letter": "N", "points": 1, "x": nil, "y": nil, "id": 54},
      {"letter": "N", "points": 1, "x": nil, "y": nil, "id": 55},
      {"letter": "N", "points": 1, "x": nil, "y": nil, "id": 56},
      {"letter": "N", "points": 1, "x": nil, "y": nil, "id": 57},
      {"letter": "N", "points": 1, "x": nil, "y": nil, "id": 58},
      {"letter": "N", "points": 1, "x": nil, "y": nil, "id": 59},

      {"letter": "O", "points": 1, "x": nil, "y": nil, "id": 60},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "id": 61},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "id": 62},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "id": 63},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "id": 64},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "id": 65},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "id": 66},
      {"letter": "O", "points": 1, "x": nil, "y": nil, "id": 67},

      {"letter": "P", "points": 3, "x": nil, "y": nil, "id": 68},
      {"letter": "P", "points": 3, "x": nil, "y": nil, "id": 69},

      {"letter": "R", "points": 1, "x": nil, "y": nil, "id": 70},
      {"letter": "R", "points": 1, "x": nil, "y": nil, "id": 71},
      {"letter": "R", "points": 1, "x": nil, "y": nil, "id": 72},
      {"letter": "R", "points": 1, "x": nil, "y": nil, "id": 73},
      {"letter": "R", "points": 1, "x": nil, "y": nil, "id": 74},
      {"letter": "R", "points": 1, "x": nil, "y": nil, "id": 75},

      {"letter": "S", "points": 1, "x": nil, "y": nil, "id": 76},
      {"letter": "S", "points": 1, "x": nil, "y": nil, "id": 77},
      {"letter": "S", "points": 1, "x": nil, "y": nil, "id": 78},
      {"letter": "S", "points": 1, "x": nil, "y": nil, "id": 79},

      {"letter": "T", "points": 1, "x": nil, "y": nil, "id": 80},
      {"letter": "T", "points": 1, "x": nil, "y": nil, "id": 81},
      {"letter": "T", "points": 1, "x": nil, "y": nil, "id": 82},
      {"letter": "T", "points": 1, "x": nil, "y": nil, "id": 83},
      {"letter": "T", "points": 1, "x": nil, "y": nil, "id": 84},
      {"letter": "T", "points": 1, "x": nil, "y": nil, "id": 85},

      {"letter": "U", "points": 1, "x": nil, "y": nil, "id": 86},
      {"letter": "U", "points": 1, "x": nil, "y": nil, "id": 87},
      {"letter": "U", "points": 1, "x": nil, "y": nil, "id": 88},
      {"letter": "U", "points": 1, "x": nil, "y": nil, "id": 89},

      {"letter": "V", "points": 4, "x": nil, "y": nil, "id": 90},
      {"letter": "V", "points": 4, "x": nil, "y": nil, "id": 91},

      {"letter": "W", "points": 4, "x": nil, "y": nil, "id": 92},
      {"letter": "W", "points": 4, "x": nil, "y": nil, "id": 93},

      {"letter": "X", "points": 8, "x": nil, "y": nil, "id": 94},

      {"letter": "Y", "points": 4, "x": nil, "y": nil, "id": 95},
      {"letter": "W", "points": 4, "x": nil, "y": nil, "id": 96},

      {"letter": "Z", "points": 10, "x": nil, "y": nil, "id": 97},

      {"letter": "", "points": nil, "x": nil, "y": nil, "id": 98},
      {"letter": "", "points": nil, "x": nil, "y": nil, "id": 99}
  ]

    self.bag = Array(0..99)
  end
end
