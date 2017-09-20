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
    self.tiles = []

    self.bag = Array(0..99)
  end
end
