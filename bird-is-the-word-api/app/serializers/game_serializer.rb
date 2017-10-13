class GameSerializer < ActiveModel::Serializer
  attributes :id, :board, :tiles, :bag, :player_1, :player_2

  def player_1
    {username: object.players[0].username, score: object.game_players[0].score, turns: object.game_players[0].turns}
  end
  def player_2
     {username: object.players[1].username, score: object.game_players[1].score, turns: object.game_players[1].turns}
  end
end
