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

    #remove rack tiles coordinates
    @game.tiles.map!  do |tile|
    if tile["y"] && tile["y"] >= 100
      tile["y"] = nil
      tile["x"] = nil
    end
    tile
    end

    @game.save
    #create new GamePlayer if Player 2 is joining this game
    if !GamePlayer.find_by(user_id: @user.id, game_id: @game.id)
      rack = @game.bag.sample(7)
      rack.each{|tile_id| @game.bag.delete tile_id }

      counter = 100

      
      GamePlayer.create(user_id: @user.id, game_id: @game.id, rack: rack, player_number: 2)
    else
      game_player = GamePlayer.find_by(user_id: @user.id, game_id: @game.id)
      rack = game_player.rack
    end
    #set rack coordinates
    counter = 100
    rack.each do |tile_id| 
        tile = @game.tiles.select{|tile| tile["id"] == tile_id.to_i }
        tile[0]["x"] = 1
        tile[0]["y"] = counter
        counter += 1
    end
    @game.save

    current_user_rack = GamePlayer.find_by(user_id: @user.id, game_id: @game.id).rack
    players = @game.players
    render json: @game.attributes.merge({current_user_rack: current_user_rack, players: players})
  end

  def update
    #compare params["game"]["tiles"] with @game.tiles
    #get an array of ids of played tiles
    #for each tile in that array set draggable to false
    #SCORING: for each tile in that array check up down left and right and see if it forms the word, continue up in each direction
    
    played_tiles = game_params.to_h[:tiles] - @game.tiles
    played_tiles_ids = played_tiles.map{|tile| tile["id"]}

   
    

    if @game.update(game_params)
      #disable drag for all played tiles
      played_tiles_ids.map do |id|
        @game.tiles[id]["draggable"] = false
        @game.save
      end

    #get leftover rack
      leftover_rack = []
      counter = 100
      7.times do
        tile = @game.tiles.find{|tile| tile["y"] == counter}
         if !!tile
           leftover_rack << tile["id"]
         end 
         counter +=1
      end
      game_player = GamePlayer.find_by(user_id: @user.id, game_id: @game.id)
      game_player.rack = leftover_rack
      game_player.save

      #replenish the rack 
      missing_tiles_amount = 7 - game_player.rack.length
      new_tile_ids = @game.bag.sample(missing_tiles_amount)
      new_tile_ids.each{|tile_id| @game.bag.delete tile_id }
      game_player.rack += new_tile_ids
      game_player.save

      tile_counter = 100

      #set rack coordinates
      game_player.rack.each do |tile_id| 
        tile = @game.tiles.select{|tile| tile["id"] == tile_id.to_i }
        tile[0]["x"] = 1
        tile[0]["y"] = tile_counter
        tile_counter += 1
        puts tile_counter
      end
      #change turn
      @game.turn += 1
      @game.save
      players = @game.players
      render json: @game.attributes.merge({current_user_rack: game_player.rack, players: players})



      #SCORING
      # FIRST WORD
      word_multiplier = 1
      score = 0
      played_tiles.each do |tile| 
        #get multipliers
        # x = tile["x"]
        # y = tile["y"]
        # letter_multiplier = @game.board[x][y]["letter"]
        # if @game.board[x][y]["word"] > 1
        #   word_multiplier = @game.board[x][y]["word"]
        # end 
        # score += tile["points"] * letter_multiplier


        # DETERMINE IF WORD IS VERTICAL OR HORIZONTAL
       
        #vertical word
          
          word = [tile]
          #check up 
          counter = 1
          loop do 
            next_tile = @game.tiles.select{|t| t["x"] == tile["x"] && t["y"] == tile["y"] + counter }
            if next_tile == [] then
              break
            end
            word << next_tile
            counter+=1 
          end
          #check down
          counter = 1
          loop do 
            next_tile = @game.tiles.select{|t| t["x"] == tile["x"] && t["y"] == tile["y"] - counter } 
            if next_tile == [] then
              break
            end
            word << next_tile
            counter +=1
          end

          puts word


        #horizontal word
        word = [tile]
          #check left
          counter = 1
          loop do 
            next_tile = @game.tiles.select{|t| t["x"] == tile["x"] + counter && t["y"] == tile["y"]  } 
            if next_tile == [] then
              break
            end
            word << next_tile
            counter +=1
          end
           #check right
          counter = 1
          loop do 
            next_tile = @game.tiles.select{|t| t["x"] == tile["x"] - counter  && t["y"] == tile["y"] } 
            if next_tile == [] then
              break
            end
            word << next_tile
            counter +=1 
          end

          puts word
         
         

      end
      # score = score * word_multiplier
      # puts "Your first word scored", score, "points!!!!"


      # for each played_tiles
        # tile.points

        # board[tile.x][tile.y].letter
        # board[tile.x][tile.y].word
        #words formed: tile where x = tile.x+1 y= tile.y
          #tile where x = tile.x y= tile.y + 1
          #tile where x = tile.x - 1 y= tile.y
          #tile where x = tile.x y= tile.y - 1




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
    params.require(:game).permit(tiles: [:letter, :points, :x, :y, :id, :draggable])
  end
end