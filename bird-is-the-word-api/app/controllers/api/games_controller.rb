class Api::GamesController < ApplicationController
  before_action :authenticate_token!
  before_action :set_game, only: [:show, :update, :destroy]

  def index
    render json: Game.all
  end

  def create
    game = Game.new
    if game.save
      GamePlayer.create(game_id: game.id, user_id: @user.id, player_number: 1)
      render json: game
    else
      render json: {message: "Error. Try again."}
    end
  end

  def show
    render json: @game
  end

  def update
    if @game.update(game_params)
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

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:board, :bag)
  end
end