class Api::GamesController < ApplicationController
  before_action :authenticate_token!
  before_action :set_game, only: [:show, :update, :destroy]

  def index
    render json: Game.all
  end

  def create
    game = Game.new
    if game.save
      rack = game.bag.sample(7)
      rack.each{|tile_id| game.bag.delete tile_id }

      counter = 100

      rack.each do |tile_id| 
        tile = game.tiles.select{|tile| tile["id"] == tile_id.to_i }
        tile[0]["x"] = 1
        tile[0]["y"] = counter
        counter += 1
      end

      game.save
      GamePlayer.create(game_id: game.id, user_id: @user.id, player_number: 1, rack: rack)

      players = game.players
      current_user_rack = GamePlayer.find_by(user_id: @user.id, game_id: game.id).rack
      render json: game.attributes.merge({current_user_rack: current_user_rack, players: players})

    else
      render json: {message: "Error. Try again."}
    end
  end

  def show
    #create new GamePlayer if Player 2 is joining this game
    if !GamePlayer.find_by(user_id: @user.id, game_id: @game.id)
      rack = @game.bag.sample(7)
      rack.each{|tile_id| @game.bag.delete tile_id }

      counter = 100

      rack.each do |tile_id| 
        tile = @game.tiles.select{|tile| tile["id"] == tile_id.to_i }
        tile[0]["x"] = 1
        tile[0]["y"] = counter
        counter += 1
      end
      GamePlayer.create(user_id: @user.id, game_id: @game.id, rack: rack)
    end
    current_user_rack = GamePlayer.find_by(user_id: @user.id, game_id: @game.id).rack
    players = @game.players
    render json: @game.attributes.merge({current_user_rack: current_user_rack, players: players})
  end

  def update
    if @game.update(game_params)
      #renew user's rack
      render json: @game
    else
      render json: {message: "Error. Try again."}
    end
  end

  def destroy
    if @game.destroy
      render json: {message: "Success. Item was destroyed."}
    else
      render json: {message: "Unable to remove this item."}
    end
  end

  def available_games
    available_games = Game.all.select{|game| game.players.length == 1 && game.players[0].id != @user.id}
    render json: available_games
  end
  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(tiles: [:letter, :points, :x, :y, :id])
  end
end