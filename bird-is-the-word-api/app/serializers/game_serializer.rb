class GameSerializer < ActiveModel::Serializer
  attributes :id, :board, :tiles, :bag, :player_1, :player_2, :current_user_rack

  def player_1
    {username: object.players[0].username, score: object.game_players[0].score, turns: object.game_players[0].turns}
  end
  def player_2
    if object.players.length == 2
     {username: object.players[1].username, score: object.game_players[1].score, turns: object.game_players[1].turns}
    else
      nil
    end
  end
  def current_user_rack
    if instance_options[:scope]
      current_user_rack = GamePlayer.find_by(user_id: instance_options[:scope].id, game_id: object.id).rack
      return {current_user_rack: current_user_rack}
    end
  end
end
