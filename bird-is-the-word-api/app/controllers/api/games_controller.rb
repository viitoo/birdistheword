class Api::GamesController < ApplicationController
  before_action :authenticate_token!
  before_action :set_game, only: [:show, :update, :skip_turn, :exchange_tiles, :destroy]

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

      render json: game

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

    # GameSerializer.new(@game, :current_user => @user)
    render json: @game
  end

  def update
    #compare params["game"]["tiles"] with @game.tiles
    #get an array of ids of played tiles
    #for each tile in that array set draggable to false
    #SCORING: for each tile in that array check up down left and right and see if it forms the word, continue up in each direction

    played_tiles = game_params.to_h[:tiles] - @game.tiles
   
    played_tiles = played_tiles.map!{|tile| tile["y"] == nil ? nil : tile}
    played_tiles = played_tiles.compact
    played_tiles = played_tiles.map!{|tile| tile["y"] < 100 ? tile : nil}
    played_tiles = played_tiles.compact
    puts played_tiles
    
    played_tiles_ids = played_tiles.map{|tile| tile["id"]}

    if @game.update(game_params)

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
       
      end
      #change turn
      @game.turn += 1
      @game.save
      players = @game.players

      #SCORING
      # FIRST WORD
      
      score = 0
      # set word direction to horisontal
      horisontal = true
      ############## CHECK IF THE WORD IS VERTICAL OR HORIZONTAL #############
      word_multiplier = 1

      #IF THE WORD IS HORIZONTAL
      if played_tiles.all?{|tile| tile["x"] == played_tiles.first["x"]}
        word_tiles = []
        
        puts "word is horisontal"
        sorted_tiles = played_tiles.sort_by { |tile| tile["y"] }
        puts "Sorted Played Tiles", sorted_tiles
        #all tiles that form a word: both played and the ones on board
        
        #select first horizontal played tile and add its value to the score
        tile = sorted_tiles.first
        score = tile["points"] * @game.board[tile["x"]][tile["y"]]["letter"]

        #check if the first tile has WORD multiplier
        if @game.board[tile["x"]][tile["y"]]["word"] > 1
          word_multiplier = @game.board[tile["x"]][tile["y"]]["word"]
        end

        #place first tile in the word tiles array to begin collecting all letters of the word
        word_tiles << tile
        counter = 1

        #loop to check letters to the right
        loop do
          next_tile = @game.tiles.select{|t| t["x"] == tile["x"] && t["y"] == tile["y"] + counter }[0]
          if next_tile == nil then
            break
          end
          if played_tiles.include?(next_tile)
            # if the tile is one of played ones, calculate the points taking into account the letter multiplier for that tile
            score += next_tile["points"] * @game.board[next_tile["x"]][next_tile["y"]]["letter"]
            if @game.board[next_tile["x"]][next_tile["y"]]["word"] > 1
              word_multiplier == 1 ? word_multiplier = @game.board[next_tile["x"]][next_tile["y"]]["word"] : word_multiplier += @game.board[next_tile["x"]][next_tile["y"]]["word"]
            end
          else
            #else just add tile's points without multiplier
            score += next_tile["points"]
          end
          word_tiles << next_tile
          counter += 1
        end

        #loop to check letters to the left
        counter = 1
        loop do
          next_tile = @game.tiles.select{|t| t["x"] == tile["x"] && t["y"] == tile["y"] - counter }[0]
          if next_tile == nil then
            break
          end
          if played_tiles.include?(next_tile)
            # if the tile is one of played ones, calculate the points taking into account the letter multiplier for that tile
            score += next_tile["points"] * @game.board[next_tile["x"]][next_tile["y"]]["letter"]
            if @game.board[next_tile["x"]][next_tile["y"]]["word"] > 1
              word_multiplier == 1 ? word_multiplier = @game.board[next_tile["x"]][next_tile["y"]]["word"] : word_multiplier += @game.board[next_tile["x"]][next_tile["y"]]["word"]
            end
          else
            #else just add tile's points without multiplier
            score += next_tile["points"]
          end
          word_tiles << next_tile
          counter += 1
        end
    
      main_word = word_tiles.flatten.sort_by{|tile| tile["y"]}.map{|tile| tile["letter"]}.join("")
      puts "total score for the horizontal word is", score
      puts "word is", main_word
        

      #IF WORD IS VERTICAL
        
      elsif played_tiles.all?{|tile| tile["y"] == played_tiles.first["y"]}
        horisontal = false
        puts "word is vertical"
        sorted_tiles  = played_tiles.sort_by { |tile| tile["x"] }
        puts sorted_tiles 

        word_tiles = []
        word_multiplier = 1
        # select first vertical played tile
        tile = sorted_tiles.first
        score = tile["points"] * @game.board[tile["x"]][tile["y"]]["letter"]
        if @game.board[tile["x"]][tile["y"]]["word"] > 1
          word_multiplier == 1 ? word_multiplier = @game.board[tile["x"]][tile["y"]]["word"] : word_multiplier += @game.board[tile["x"]][tile["y"]]["word"]
        end
        word_tiles << tile
        counter = 1
        loop do
          next_tile = @game.tiles.select{|t| t["x"] == tile["x"]  + counter && t["y"] == tile["y"] }[0]
          if next_tile == nil then
            break
          end
          if played_tiles.include?(next_tile)
            # if the tile is one of played ones, calculate the points taking into account the letter multiplier for that tile
            score += next_tile["points"] * @game.board[next_tile["x"]][next_tile["y"]]["letter"]
            if @game.board[next_tile["x"]][next_tile["y"]]["word"] > 1
              word_multiplier == 1 ? word_multiplier = @game.board[next_tile["x"]][next_tile["y"]]["word"] : word_multiplier += @game.board[next_tile["x"]][next_tile["y"]]["word"]
            end
          else
            #else just add tile's points without multiplier
            score += next_tile["points"]
          end
          word_tiles << next_tile
          counter += 1
        end
        counter = 1
        loop do
          next_tile = @game.tiles.select{|t| t["x"] == tile["x"]  - counter && t["y"] == tile["y"]}[0]
          if next_tile == nil then
            break
          end
          if played_tiles.include?(next_tile)
            # if the tile is one of played ones, calculate the points taking into account the letter multiplier for that tile
            score += next_tile["points"] * @game.board[next_tile["x"]][next_tile["y"]]["letter"]
            if @game.board[next_tile["x"]][next_tile["y"]]["word"] > 1
              word_multiplier == 1 ? word_multiplier = @game.board[next_tile["x"]][next_tile["y"]]["word"] : word_multiplier += @game.board[next_tile["x"]][next_tile["y"]]["word"]
            end
          else
            #else just add tile's points without multiplier
            score += next_tile["points"]
          end
          word_tiles << next_tile
          counter += 1
        end
        main_word = word_tiles.flatten.sort_by{|tile| tile["x"]}.map{|tile| tile["letter"]}.join("")
        
      end
      score = score * word_multiplier

      ###For each played tiles check other connections with existing tiles on board

      
      words = []
      words << main_word
      
      played_tiles.each do |tile| 
        additional_points = 0
        word_tiles = []
        word_tiles << tile
        word_multiplier = 1
        
        if @game.board[tile["x"]][tile["y"]]["word"] > 1 
          word_multiplier = @game.board[tile["x"]][tile["y"]]["word"]
        end
        additional_points = tile["points"] * @game.board[tile["x"]][tile["y"]]["letter"]
        
        if horisontal == true   
          counter = 1
          loop do
            next_tile = @game.tiles.select{|t| t["x"] == tile["x"] + counter && t["y"] == tile["y"]}[0]
            if next_tile == nil then
              break
            end
            word_tiles << next_tile
            additional_points += next_tile["points"]
            counter += 1
            
          end
          loop do
            next_tile = @game.tiles.select{|t| t["x"] == tile["x"] - counter && t["y"] == tile["y"]}[0]
            if next_tile == nil then
              break
            end

            additional_points += next_tile["points"]
            word_tiles << next_tile
            # word_tiles_points << next_tile["points"]
            counter += 1


            
            end

          
        elsif horisontal == false
          puts "horisontal", horisontal
          # word_tiles_points << tile["points"] * @game.board[tile["x"]][tile["y"]]["letter"]
          counter = 1
          loop do
            next_tile = @game.tiles.select{|t| t["x"] == tile["x"] && t["y"] == tile["y"] + counter}[0]
            if next_tile == nil then
              break
            end
            additional_points += next_tile["points"]
            word_tiles << next_tile
            # word_tiles_points << next_tile["points"]
            counter += 1
          end
          loop do
            next_tile = @game.tiles.select{|t| t["x"] == tile["x"] && t["y"] == tile["y"] - counter}[0]
            if next_tile == nil then
              break
            end

            additional_points += next_tile["points"]
            word_tiles << next_tile
            # word_tiles_points << next_tile["points"]
            counter += 1
          end

        end
        

        if word_tiles.length > 1
          word = word_tiles.flatten.sort_by{|tile| tile["x"]}.map{|tile| tile["letter"]}.join("")
          additional_points = additional_points * word_multiplier
          words << word
          puts "adding word", word
          puts "adding points", additional_points
          score += additional_points
        end
      end
      puts "played words", words
      puts "total_score", score
      game_player.score += score
      game_player.save

      turn = Turn.create(game_player_id: game_player.id, played_word: words.join(", "), points: score)


      #check if there is a winner
      opponents_tiles_score = 0
      if game_player.rack.length == 0
        opponent = @game.players.where.not(id: @user.id)[0]
        opponents_rack = GamePlayer.find_by(game_id: @game.id, user_id: opponent.id).rack
        opponents_rack.map do |tile_id| 
          opponents_tiles_score += @game.tiles.select{|t| t["id"] == tile_id.to_i}[0]["points"]
        end
      turn.points += score
      turn.save
      end

      #disable drag for all played tiles
      played_tiles_ids.map do |id|
        @game.tiles[id]["draggable"] = false
        @game.save
      end
      # GameSerializer.new(@game, :current_user => @user)
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

  def exchange_tiles
    #remove rack tiles coordinates
    @game.tiles.map!  do |tile|
      if tile["y"] && tile["y"] >= 100
        tile["y"] = nil
        tile["x"] = nil
      end
      tile
    end
    #find game player
    game_player = GamePlayer.find_by(game_id: @game.id, user_id: @user.id)
    #put the tile ids back in the bag
    player_rack = game_player.rack.map{|tile| @game.bag << tile.to_i}
    #empty the rack
    game_player.rack = []
    #get new tiles
    rack = @game.bag.sample(7)
      rack.each{|tile_id| @game.bag.delete tile_id }

      counter = 100
    #set rack coordinates again
      rack.each do |tile_id| 
        tile = @game.tiles.select{|tile| tile["id"] == tile_id.to_i }
        tile[0]["x"] = 1
        tile[0]["y"] = counter
        counter += 1
      end
    game_player.rack = rack
    game_player.save
    @game.turn += 1
    @game.save

    #create a fake turn that says that user exchanged tiles
    turn = Turn.create(game_player_id: game_player.id, played_word: "exchanged tiles", points: 0)

    render json: @game
  end

  def skip_turn
    @game.turn += 1
    @game.save
    game_player = GamePlayer.find_by(game_id: @game.id, user_id: @user.id)
    #create a fake turn that says that user skipped turn
    turn = Turn.create(game_player_id: game_player.id, played_word: "exchanged tiles", points: 0)
    render json: @game
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(tiles: [:letter, :points, :x, :y, :id, :draggable])
  end
end