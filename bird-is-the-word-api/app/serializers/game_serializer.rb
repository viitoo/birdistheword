class GameSerializer < ActiveModel::Serializer
  attributes :id, :board, :tiles, :bag, :player_1, :player_2, :current_user_rack, :turn, :current_player_number, :winner

  def player_1
    game_player = GamePlayer.where(game_id: object.id, player_number: 1)[0]
    {username: User.find(game_player.user_id).username, score: game_player.score, turns: game_player.turns}
  end
  def player_2
    if object.players.length == 2
      game_player = GamePlayer.where(game_id: object.id, player_number: 2)[0]
     {username: User.find(game_player.user_id).username, score: game_player.score, turns: game_player.turns}
    else
      nil
    end
  end
  def current_user_rack
    if instance_options[:scope]
      if GamePlayer.find_by(user_id: instance_options[:scope].id, game_id: object.id)
        GamePlayer.find_by(user_id: instance_options[:scope].id, game_id: object.id).rack
      end
    else
      nil
    end
  end
  def current_player_number
    if instance_options[:scope]
      if GamePlayer.find_by(user_id: instance_options[:scope].id, game_id: object.id)
        GamePlayer.find_by(user_id: instance_options[:scope].id, game_id: object.id).player_number
      end
    else
      nil
    end
  end

  def winner
    if instance_options[:scope] && GamePlayer.find_by(user_id: instance_options[:scope].id, game_id: object.id).rack.length === 0
      object.players.where.not(id: instance_options[:scope].id)[0].username.upcase
    else 
      ""
    end
  end

end
